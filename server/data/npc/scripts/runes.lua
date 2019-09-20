local discount = {[1] = {required = 1000, amount = 5},
				  [2] = {required = 2000, amount = 10},
				  [3] = {required = 3000, amount = 15},
				  [4] = {required = 4000, amount = 20},
				  [5] = {required = 5000, amount = 25},
				  [6] = {required = 6000, amount = 30},
				  [7] = {required = 7000, amount = 35},
				  [8] = {required = 8000, amount = 40},
				  [9] = {required = 9000, amount = 45},
				  [10] = {required = 10000, amount = 50}}
				  
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

	local priceRunes = 1100
		for disc = #discount,1,-1 do
			if(getPlayerRunesMade(cid) >= discount[disc].required) then
				priceRunes =  priceRunes *(1 - discount[disc].amount/100)
			break
		end
	end
	
	local priceFluid = 200
	for disc = #discount,1,-1 do
		if(getPlayerRunesMade(cid) >= discount[disc].required) then
			priceFluid =  priceFluid *(1 - discount[disc].amount/100)
		break
		end
	end

if msgcontains(msg, 'bp of mf') or msgcontains(msg, 'bp of mana') or msgcontains(msg, 'bp of mana fluid') then
	npcHandler:say('Do you want to buy a backpack of mana fluid for '..priceRunes..' gold coins?')
	talk_state = 6
	
		elseif msgcontains(msg, 'yes') and talk_state == 6 then

			if getPlayerMoney(cid) >= priceRunes then
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
				doPlayerRemoveMoney(cid, priceRunes)
				npcHandler:say('Thank you for buying.')
				talk_state = 0
			else
				npcHandler:say('You don\'t have enough money.')
				talk_state = 0
			end
	end	

if msgcontains(msg, 'bp of blank rune') or msgcontains(msg, 'bp of blankrune') or msgcontains(msg, 'bp of blank') then
	npcHandler:say('Do you want to buy a backpack of blank rune for '..priceFluid..' gold coins?')
	talk_state = 7
	
		elseif msgcontains(msg, 'yes') and talk_state == 7 then
			if getPlayerMoney(cid) >= priceFluid then
				brown_bp = doPlayerAddItem(cid, 1988, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)
				doAddContainerItem(brown_bp, 2260, 1)

				doPlayerRemoveMoney(cid, priceFluid)
				npcHandler:say('Thank you for buying.')
				talk_state = 0
			else
				npcHandler:say('You don\'t have enough money.')
				talk_state = 0
			end
	end	


local shopModule = ShopModule:new()
npcHandler:addModule(shopModule)

-- Empty Vial
shopModule:addSellableItem({'empty', 'vial'}, 2006, 5, 'vial')

-- Spell Book

shopModule:addBuyableItem({'spellbook'}, 2175, 150,	'spellbook')

-- Ring
shopModule:addBuyableItem({'life ring'}, 2168, 900,	'life ring')

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

shopModule:addBuyableItem({'blank rune'}, 2260, 10, 'blank rune')

end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())

