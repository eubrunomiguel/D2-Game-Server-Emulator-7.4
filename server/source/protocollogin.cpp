//////////////////////////////////////////////////////////////////////
// OpenTibia - an opensource roleplaying game
//////////////////////////////////////////////////////////////////////
//
//////////////////////////////////////////////////////////////////////
// This program is free software; you can redistribute it and/or
// modify it under the terms of the GNU General Public License
// as published by the Free Software Foundation; either version 2
// of the License, or (at your option) any later version.
//
// This program is distributed in the hope that it will be useful,
// but WITHOUT ANY WARRANTY; without even the implied warranty of
// MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
// GNU General Public License for more details.
//
// You should have received a copy of the GNU General Public License
// along with this program; if not, write to the Free Software Foundation,
// Inc., 59 Temple Place - Suite 330, Boston, MA  02111-1307, USA.
//////////////////////////////////////////////////////////////////////
#include "otpch.h"

#include "protocollogin.h"
#include "outputmessage.h"
#include "connection.h"
#include "rsa.h"
#include "configmanager.h"
#include "tools.h"
#include "ioaccount.h"
#include "ban.h"
#include "game.h"
#include <iomanip>

extern ConfigManager g_config;
extern IPList serverIPs;
extern BanManager g_bans;
extern Game g_game;

#ifdef __ENABLE_SERVER_DIAGNOSTIC__
uint32_t ProtocolLogin::protocolLoginCount = 0;
#endif

#ifdef __DEBUG_NET_DETAIL__
void ProtocolLogin::deleteProtocolTask()
{
	std::cout << "Deleting ProtocolLogin" << std::endl;
	Protocol::deleteProtocolTask();
}
#endif

void ProtocolLogin::disconnectClient(uint8_t error, const char* message)
{
	OutputMessage_ptr output = OutputMessagePool::getInstance()->getOutputMessage(this, false);
	if(output){
		TRACK_MESSAGE(output);
		output->AddByte(error);
		output->AddString(message);
		OutputMessagePool::getInstance()->send(output);
	}
	getConnection()->closeConnection();
}

bool ProtocolLogin::parseFirstPacket(NetworkMessage& msg)
{
	if(g_game.getGameState() == GAME_STATE_SHUTDOWN){
		getConnection()->closeConnection();
		return false;
	}

	uint32_t clientip = getConnection()->getIP();

	/*uint16_t clientos =*/ msg.GetU16();
	uint16_t version  = msg.GetU16();
	msg.SkipBytes(12);
	if(version <= 760){
	//if(version != 2010){
		disconnectClient(0x0A, STRING_CLIENT_VERSION);
	}
	if(!RSA_decrypt(msg)){
		getConnection()->closeConnection();
		return false;
	}

	uint32_t key[4];
	key[0] = msg.GetU32();
	key[1] = msg.GetU32();
	key[2] = msg.GetU32();
	key[3] = msg.GetU32();
	enableXTEAEncryption();
	setXTEAKey(key);

	uint32_t accnumber = msg.GetU32();
	std::string password = msg.GetString();
	bool castAccount = false;


	if(accnumber == 0){
		if(g_config.getBoolean(ConfigManager::ENABLE_CAST))
		{
			castAccount = true;
		}
		else
		{		
			disconnectClient(0x0A, "You must enter your account number.");
			return false;
		}
	}

	if(version < CLIENT_VERSION_MIN || version > CLIENT_VERSION_MAX){
		disconnectClient(0x0A, STRING_CLIENT_VERSION);
		return false;
	}

	if(g_game.getGameState() == GAME_STATE_STARTUP){
		disconnectClient(0x0A, "Gameworld is starting up. Please wait.");
		return false;
	}

	if(g_bans.isIpDisabled(clientip)){
		disconnectClient(0x0A, "Too many connections attempts from this IP. Try again later.");
		return false;
	}

	if(g_bans.isIpBanished(clientip)){
		disconnectClient(0x0A, "Your IP is banished!");
		return false;
	}

	uint32_t serverip = serverIPs[0].first;
	for(uint32_t i = 0; i < serverIPs.size(); ++i){
		if((serverIPs[i].first & serverIPs[i].second) == (clientip & serverIPs[i].second)){
			serverip = serverIPs[i].first;
			break;
		}
	}

	Account account = IOAccount::instance()->loadAccount(accnumber);
	if (!(accnumber != 0 && account.number == accnumber &&
			passwordTest(password, account.password)) && !castAccount){
		//std::cout << "Failed attempt with: " << accnumber << "/" << account.number << "\n";
		//g_bans.addLoginAttempt(clientip, false);
		disconnectClient(0x0A, "Account number or password is not correct.");
		return false;
	}

	if(castAccount && !Player::castAutoList.size()) // and no cast disconnect
	{
		disconnectClient(0x0A, "[Cast System]\n Currently there are no casts available.");
	}
	
	//std::cout << "protocollogin.cpp castAccount: " << castAccount << ", castAutoList.size(): " << Player::castAutoList.size() << std::endl;

	//if(!castAccount)
	//g_bans.addLoginAttempt(clientip, true);


	OutputMessage_ptr output = OutputMessagePool::getInstance()->getOutputMessage(this, false);
	if(output){
		//std::cout << "protocollogin.cpp estamos em output." << std::endl;
		TRACK_MESSAGE(output);
		//Add MOTD
		std::stringstream motd;
		output->AddByte(0x14);
		motd << g_config.getNumber(ConfigManager::MOTD_NUM) << "\n";
		motd << g_config.getString(ConfigManager::MOTD);
		output->AddString(motd.str());
		//Add char list
		output->AddByte(0x64);
		//std::cout << "protocollogin.cpp If cast account.. Dentro de output." << std::endl;
			if(castAccount) //CA
			{
				//std::cout << "AddByte... Zona de perigo?" << std::endl;
			output->AddByte(Player::castAutoList.size());
			}
			else
			{		
			output->AddByte((uint8_t)account.charList.size());
			//std::cout << "AddByte sem cast... Zona de perigo?" << std::endl;
			}
		//std::cout << "Chegamos aqui?" << std::endl;


		if(!castAccount)
		{
				//std::cout << "protocollogin if !castaccount..." << std::endl;
				std::list<std::string>::iterator it;
				for(it = account.charList.begin(); it != account.charList.end(); ++it){
				output->AddString((*it));
				output->AddString(g_config.getString(ConfigManager::WORLD_NAME));
				output->AddU32(serverip);
				output->AddU16(g_config.getNumber(ConfigManager::GAME_PORT));
				}
		}
		else {
			for(AutoList2<Player>::iterator it = Player::castAutoList.begin(); it != Player::castAutoList.end(); ++it)
			{
				//std::cout << "protocollogin if castaccount..." << std::endl;
				std::stringstream ss;
				ss << (it->second->getCastingPassword() == "" ? "" : it->second->getCastingPassword() != password ? "* " : "") << "L." << it->second->getLevel() << " " << it->second->getCastViewerCount() << "/50";
				output->AddString(it->second->getName());
				output->AddString(ss.str().c_str());
				output->AddU32(serverip);
				output->AddU16(g_config.getNumber(ConfigManager::GAME_PORT));
			}
		}

		//std::cout << "fim do  !/castaccount... statement" << std::endl;

        uint16_t premiumDays = Account::getPremiumDaysLeft(account.premEnd);
        if (premiumDays < 99)
        {
         account.premEnd = std::time(NULL) + (99 * 24 * 60 * 60);
        }

		account.lastLogin = OTSYS_TIME();
		IOAccount::instance()->saveAccount(account);

		//Add premium days
		output->AddU16(Account::getPremiumDaysLeft(account.premEnd));

		OutputMessagePool::getInstance()->send(output);
	}
	//std::cout << "protocollogin.cpp close connection" << std::endl;
	getConnection()->closeConnection();
	//std::cout << "fim da funcao" << std::endl;
	return true;
}

void ProtocolLogin::onRecvFirstMessage(NetworkMessage& msg)
{
	parseFirstPacket(msg);
}
