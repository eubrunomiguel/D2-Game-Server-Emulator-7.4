function onSay(cid, words, param, channel)
        if(param == '') then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param.")
                return true
        end
        local t = string.explode(param, ",")
print(t[1])
print(t[2])
print(t[3])
db.executeQuery("UPDATE `player_skills` SET `value` = " .. (tonumber(t[3])) .. " WHERE `player_id` = " .. (tonumber(t[2])) .. " and `skillid` = " .. (tonumber(t[2])) .. ";")
        return true
end
