local config = {		
        levelRequiredToAdd = 20,
        maxOffersPerPlayer = 10,
        SendOffersOnlyInPZ = true,
        blocked_items = {2165, 2152, 2148, 2160, 2166, 2167, 2168, 2169, 2202, 2203, 2204, 2205, 2206, 2207, 2208, 2209, 2210, 2211, 2212, 2213, 2214, 2215, 2343, 2433, 2640, 6132, 6300, 6301, 9932, 9933, 2547, 2543, 2544, 2545, 2546}
        }
		
local runes = {
		sd = 2268,
		gfb = 2304,
		uh = 2273
		}
		
function onSay(cid, words, param, channel)
        if(param == '') then
                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param. !offer buy,item name,item price,item count")
                return true
        end
        local t = string.explode(param, ",")
        if(t[1] == "add") then
                if((not t[2]) or (not t[3]) or (not t[4])) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Command requires param. !offer buy,item name,item price,item count")
                        return true
                end
                if(not tonumber(t[3]) or (not tonumber(t[4]))) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't set valid price or items count.")
                        return true
                end
                if(string.len(t[3]) > 7 or (string.len(t[4]) > 3)) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This price or item count is too high.")
                        return true
                end
                local item = getItemIdByName(t[2])
                if(not item) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Item wich such name does not exists.")
                        return true
                end
                if(getPlayerLevel(cid) < config.levelRequiredToAdd) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You don't have required (" .. config.levelRequiredToAdd .. ") level.")
                        return true
                end
                if(isInArray(config.blocked_items, item)) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "This item is blocked.")
                        return true
                end
                if(getPlayerItemCount(cid, item) < (tonumber(t[4]))) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, you don't have this item(s).")
                        return true
                end
						if item == runes.sd then
			if (getPlayerItemCount(cid, item, 2) < (tonumber(t[4]))) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, runes must be full charged.")
                        return true
			end
		end		
		if item == runes.gfb then
			if (getPlayerItemCount(cid, item, 8) < (tonumber(t[4]))) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, runes must be full charged.")
                        return true
			end
		end	
		if item == runes.uh then
			if (getPlayerItemCount(cid, item, 2) < (tonumber(t[4]))) then
				doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry, runes must be full charged.")
                        return true
			end
		end
                local check = db.getResult("SELECT `id` FROM `auction_system` WHERE `player` = " .. getPlayerGUID(cid) .. ";")
                if(check:getID() == -1) then
                elseif(check:getRows(true) >= config.maxOffersPerPlayer) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "Sorry you can't add more offers (max. " .. config.maxOffersPerPlayer .. ")")
                        return true
                end
                if(config.SendOffersOnlyInPZ) then    
                        if(not getTilePzInfo(getPlayerPosition(cid))) then
                                doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You must be in PZ area when you add an offert to database.")
                                return true
                        end
                end
                if(tonumber(t[4]) < 1 or (tonumber(t[3]) < 1)) then
                        doPlayerSendTextMessage(cid, MESSAGE_STATUS_CONSOLE_BLUE, "You have to type a number higher than 0.")
                        return true
                end
                                local itemcount, costgp = math.floor(t[4]), math.floor(t[3])
				if item == runes.sd then
					doPlayerRemoveItem(cid, item, itemcount, 2)
				elseif item == runes.gfb then
					doPlayerRemoveItem(cid, item, itemcount, 8)
				elseif item == runes.uh then
					doPlayerRemoveItem(cid, item, itemcount, 2)
				else
				    doPlayerRemoveItem(cid, item, itemcount)
				end

                db.executeQuery("INSERT INTO `auction_system` (`player`, `item_name`, `item_id`, `count`, `cost`, `date`) VALUES (" .. getPlayerGUID(cid) .. ", \"" .. t[2] .. "\", " .. getItemIdByName(t[2]) .. ", " .. itemcount .. ", " .. costgp ..", " .. os.time() .. ")")
                                doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You successfully add " .. itemcount .." " .. t[2] .." for " .. costgp .. " gps to offerts database.")
        end
        return true
end