

local kits = {  [2160] = {{2160, 100},{2160, 21}}}


function onSay(cid, words, param)
    --local new_item = doCreateItemEx(2160, 10)
    --doSetItemSpecialDescription(new_item, "This item was bought by ".. player_name ..".")
   -- doPlayerAddDepotItems(getCreatureName(cid), "thais", new_item, "hello")
    local player = getCreatureByName("Oldschool")
    if isPlayer(player) then
        doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, (kits[2160] ~= nil and 1 or 2))
        doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, (kits[2161] ~= nil and 1 or 2))
        for _, item in ipairs(kits[2160]) do
            doPlayerSendTextMessage(player, MESSAGE_INFO_DESCR, item[1] .. "-" .. item[2])
        end
    end
	return false
end
