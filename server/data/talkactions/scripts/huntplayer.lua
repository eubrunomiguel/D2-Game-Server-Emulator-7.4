function onSay(cid, words, param, channel)
    if(param == '') then
            doPlayerSendCancel(cid, "Command requires param.")
            return true
    end
    local tmp = string.explode(param, ",")

    local money = tonumber(tmp[2])
    local targetname = tmp[1]

	if not targetname then
		doPlayerSendCancel(cid, "You need to set a target.")
		return true
	end

	if not money then
		doPlayerSendCancel(cid, "You need to set a price.")
		return true
	end

	if money < 10000 then
		doPlayerSendCancel(cid, "Minimum price is 10000 gold coins.")
		return true
	end
	
	if targetname == getPlayerName(cid) then
		doPlayerSendCancel(cid, "You cannot target yourself, come on man.")
		return true
	end

	doPlayerHunt(cid, tmp[1], money)
	
	return true
end