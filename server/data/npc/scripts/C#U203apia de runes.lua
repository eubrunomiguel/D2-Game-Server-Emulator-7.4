local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)

-- OTServ event handling functions start
function onCreatureAppear(cid)				npcHandler:onCreatureAppear(cid) end
function onCreatureDisappear(cid) 			npcHandler:onCreatureDisappear(cid) end
function onCreatureSay(cid, type, msg) 	npcHandler:onCreatureSay(cid, type, msg) end
function onThink() 						npcHandler:onThink() end
-- OTServ event handling functions end

function creatureSayCallback(cid, type, msg)
	if(npcHandler.focus ~= cid) then
		return false
	end

--[[ 
if msgcontains(msg, 'bp of mf') or msgcontains(msg, 'bp of manafluid') or msgcontains(msg, 'bp of mana fluid') then
	npcHandler:say('Do you want to buy a backpack of mana fluid for 1100 gold coins?')
	talk_state = 6
	
		elseif msgcontains(msg, 'yes') and talk_state == 6 then
			if getPlayerMoney(cid) >= 1100 then
				brown_bp = doPlayerAddItem(cid, 1988, 1)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doAddContainerItem(brown_bp, 2006, 7)
				doPlayerRemoveMoney(cid, 1100)
				npcHandler:say('Thank you for buying.')
				talk_state = 0
			else
				npcHandler:say('You don\'t have enough money.')
				talk_state = 0
			end
	end	
	
		return TRUE
end ]]--

local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Empty Vial
shopModule:addSellableItem({'empty', 'vial'}, 2006, 5, 'vial')

-- Spell Book

shopModule:addBuyableItem({'spellbook'}, 2175, 150,	'spellbook')

-- Wand

shopModule:addBuyableItem({'light wand', 'lightwand'}, 2163, 500, 'magic light wand')
shopModule:addBuyableItem({'wand of vortex', 'vortex'}, 2190, 500, 'wand of vortex')
shopModule:addBuyableItem({'wand of dragonbreath', 'dragonbreath'}, 2191, 1000, 'wand of dragonbreath')
shopModule:addBuyableItem({'wand of plague', 'plague'}, 2188, 5000, 'wand of plague')
shopModule:addBuyableItem({'wand of cosmic energy', 'cosmic energy'}, 2189, 10000, 'wand of cosmic energy')
shopModule:addBuyableItem({'wand of inferno', 'inferno'}, 2187, 15000, 'wand of inferno')

-- Rods

shopModule:addBuyableItem({'snakebite rod', 'snakebite'}, 2182, 500, 'snakebite rod')
shopModule:addBuyableItem({'moonlight rod', 'moonlight'}, 2186, 1000, 'moonlight rod')
shopModule:addBuyableItem({'volcanic rod', 'volcanic'}, 2185, 5000, 'necrotic rod')
shopModule:addBuyableItem({'terra rod', 'terra'}, 2181, 10000, 'terra rod')
shopModule:addBuyableItem({'tempest rod', 'tempest'}, 2183, 15000, 'tempest rod')

-- Fluids

shopModule:addBuyableItem({'life fluid','lifefluid'}, 2006, 60,10,'life fluid')
shopModule:addBuyableItem({'mana fluid','manafluid'},2006,55,7,'mana fluid')

-- Runas 

shopModule:addBuyableItem({'blank rune', 'blank'}, 2260, 5, 'blank rune')

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())