
function onSay(cid, words, param, channel)
	if(param == '') then
	doPlayerSendTextMessage(cid, 21, "Digite o comando correto.")
	return true
	end

	local t = string.explode(param, ",")
	player = getPlayerByName(t[1])

	if(not t[2] or t[2] == '') then
	doPlayerSendTextMessage(cid, 21, "Digite o comando correto.")
	end

	if t[2] then
	time = tonumber(t[2]*60000) -- 10*1000 is 10 seconds.
	if isPlayer(player) then
	doPlayerMuteHelp(player, time)
	else
	doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Jogador " .. t[1] .. " não existe ou não está online.")
	end
	end

return true
end