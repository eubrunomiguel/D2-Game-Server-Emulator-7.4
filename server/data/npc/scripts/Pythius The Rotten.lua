local keywordHandler = KeywordHandler:new()
local npcHandler = NpcHandler:new(keywordHandler)
NpcSystem.parseParameters(npcHandler)
local talkState = {}
local storage= 14201

function onCreatureAppear(cid)			npcHandler:onCreatureAppear(cid)			end
function onCreatureDisappear(cid)			npcHandler:onCreatureDisappear(cid)			end
function onCreatureSay(cid, type, msg)		npcHandler:onCreatureSay(cid, type, msg)		end
function onThink()					npcHandler:onThink()					end

function creatureSayCallback(cid, type, msg)
	if(not npcHandler:isFocused(cid)) then
		return false
	end

	local talkUser = NPCHANDLER_CONVBEHAVIOR == CONVERSATION_DEFAULT and 0 or cid

	if (msgcontains(msg, "mission")) then
		if (getPlayerLevel(cid) >= 100) then
			if (getPlayerStorageValue(cid, storage) == EMPTY_STORAGE) then
				selfSay("I HAVE A MISSION FOR YOU BUT YOU NEED TO DIE FIRST AND RETURN AS AN UNDEAD CREATURE. COME BACK TO ME WHEN YOU ACHIEVED THIS GOAL.!", cid)
				talkState[talkUser] = 1
			else
				selfSay("I already gave you access.", cid)
			end
		else
			selfSay("Your level is too low! Come back when ready.", cid)
		end
	elseif (msgcontains(msg, "undead") and talkState[talkUser] == 1) then
		selfSay("BOON AND BANE. I HAVE CHOSEN THIS LIFE VOLUNTARILLY AND I NEVER REGRET IT. MY TREASURE IS GROWING BIGGER EACH DAY.", cid)
		talkState[talkUser] = 2
	elseif (msgcontains(msg, "treasure") and talkState[talkUser] == 2) then
		selfSay("LIKE MY TREASURE? WANNA PICK SOMETHING OUT OF IT?.", cid)
		talkState[talkUser] = 3
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 3) then
		selfSay("HAHAHA, WHO WOULD SAY SOMETHING ELSE?....BUT....NOTHING'S FOR FREE AND SO WASN'T THE TREASURE BEHIND ME. ...", cid)
		selfSay("BRING ME SOMETHING VALUABLE IN EXCHANGE. SOMETHING YOU THINK I'D LIKE AND THEN.....HAHAHAHA......WE CAN CONTINUE OUR SMALL CONVERSATION.", cid)
		selfSay("EVERYTHING YOU CARRY WITH YOU CAN ALSO BE FOUND IN MY TREASURE. BRING ME SOMETHING I DON'T OWN!!!", cid)
		talkState[talkUser] = 4
	elseif (msgcontains(msg, "offer") and talkState[talkUser] == 4) then
		selfSay("I GRANT YOU ACCESS TO THE DUNGEON IN THE NORTH. YOU'LL FIND SOME OF MY LIVING BROTHERS THERE....BUT.....EVERY TIME YOU WANT TO ENTER YOU HAVE TO GIVE ME SOMETHING PRECIOUS. ALRIGHT?", cid)
		talkState[talkUser] = 5
	elseif (msgcontains(msg, "yes") and talkState[talkUser] == 5) then
		selfSay("AS YOU WISH. WHAT DO YOU HAVE TO OFFER?", cid)
		talkState[talkUser] = 6
	elseif (msgcontains(msg, "golden mug") and talkState[talkUser] == 6) then
		if (getPlayerItemCount(cid, 2033) >= 1) then
			doPlayerRemoveItem(cid, 2033, 1)
			selfSay("I LIKE THAT AND GRANT YOU ACCESS TO THE DUNGEON IN THE NORTH FOR THE NEXT FEW MINUTES. COME BACK ANYTIME AND BRING ME MORE TREASURES.", cid)
			setPlayerStorageValue(cid, storage, 1)
		else
			selfSay("GRRR...", cid)
		end
	end

	return true
end

npcHandler:setCallback(CALLBACK_MESSAGE_DEFAULT, creatureSayCallback)
npcHandler:addModule(FocusModule:new())