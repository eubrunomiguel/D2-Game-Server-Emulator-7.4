-- ### CONFIG ###
-- message send to player by script "type" (types you can check in "global.lua")
SHOP_MSG_TYPE = 19
-- time (in seconds) between connections to SQL database by shop script
SQL_interval = 30
-- maximum delivery per iteration, to avoid long time waiting
SHOP_MAXIMUM_DELIVERY = 5
-- ### END OF CONFIG ###


local kits = {
                [1987] = { {2403, 1}, {2416, 1}, {2405, 1} },
                [1999] = { {2120, 1}, {2554, 1}, {2553, 1}, {2420, 1}, {2789, 35}, {2152, 10} }
             }

function onThink(interval, lastExecution)
    local result_plr = db.getResult("SELECT * FROM z_ots_comunication WHERE `type` = 'login';")
    local delivery_count = 0
    if(result_plr:getID() ~= -1) then
        while(true) do
            local id = tonumber(result_plr:getDataInt("id"))
            local action = tostring(result_plr:getDataString("action"))
            local delete = tonumber(result_plr:getDataInt("delete_it"))
            local player_name = tostring(result_plr:getDataString("name"))
            local itemtogive_id = tonumber(result_plr:getDataInt("param1"))
            local itemtogive_count = tonumber(result_plr:getDataInt("param2"))
            local container_id = tonumber(result_plr:getDataInt("param3"))
            local container_count = tonumber(result_plr:getDataInt("param4"))
            local add_item_type = tostring(result_plr:getDataString("param5"))
            local add_item_name = tostring(result_plr:getDataString("param6"))
            local to_town = tostring(result_plr:getDataString("param7"))

            local received_item = 0
            local message = 'You have received ' .. add_item_name .. ' from our shop. Your item is located at the depot of ' .. to_town .. '.'

            if add_item_type == 'container' then
                local new_container = doCreateItemEx(container_id, 1)
                local iter = 0
                while iter ~= container_count do
                    doAddContainerItem(new_container, itemtogive_id, itemtogive_count)
                    iter = iter + 1
                end
                doPlayerAddDepotItems(player_name, to_town, new_container, message)
            else
                if kits[itemtogive_id] ~= nil then
                    local new_container = doCreateItemEx(itemtogive_id, 1)
                    for _, item in ipairs(kits[itemtogive_id]) do
                        doAddContainerItem(new_container, item[1], item[2])
                    end
                    doPlayerAddDepotItems(player_name, to_town, new_container, message)
                else
                    local new_item = doCreateItemEx(itemtogive_id, itemtogive_count)
                    doSetItemSpecialDescription(new_item, "This item was bought by ".. player_name ..".")
                    doPlayerAddDepotItems(player_name, to_town, new_item, message)
                end
            end

            db.executeQuery("DELETE FROM `z_ots_comunication` WHERE `id` = " .. id .. ";")
            db.executeQuery("UPDATE `z_shop_history_item` SET `trans_state`='realized', `trans_real`=" .. os.time() .. " WHERE id = " .. id .. ";")

            delivery_count = delivery_count + 1
            if not(result_plr:next()) or delivery_count > SHOP_MAXIMUM_DELIVERY then
                break
            end
        end
        result_plr:free()
    end
    return TRUE
end