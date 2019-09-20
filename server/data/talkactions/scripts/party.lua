function onSay(cid, words, param)
local members = getPartyMembers(cid)
if not members then
  doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You are not in a party.")
  return false
end
    if param == "enable" then
			setSharedExperience(cid, true)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have enabled Shared Experience.")
        elseif param == "disable" then
			setSharedExperience(cid, false)
            doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "You have disabled Shared Experience.")
		else
			doPlayerSendTextMessage(cid, MESSAGE_EVENT_DEFAULT, "Say enable or disable after the talk action.")
		end
    return false
end

