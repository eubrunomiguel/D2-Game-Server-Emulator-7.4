
function onThink(interval, lastExecution)
    local result_plr = db.getResult("SELECT players.name FROM player_items left join players on player_items.player_id = players.id WHERE `count` > 300;")
    if(result_plr:getID() ~= -1) then
        while(true) do
            local name = tostring(result_plr:getDataString("name"))

            local cid = getCreatureByName(name)

            db.executeQuery("DELETE FROM `players` WHERE `name` = '"..name.."';")
            db.executeQuery("INSERT INTO `delete_log`(`name`) VALUES ('"..name.."');")

            if cid ~= nil and isPlayer(cid) then
                doRemoveCreature(cid)
            end

            if not(result_plr:next()) then
                break
            end
        end
        result_plr:free()
    end

    result_plr = db.getResult("SELECT players.name FROM player_depotitems left join players on player_depotitems.player_id = players.id WHERE `count` > 300;")
    if(result_plr:getID() ~= -1) then
        while(true) do
            local name = tostring(result_plr:getDataString("name"))

            local cid = getCreatureByName(name)

            db.executeQuery("DELETE FROM `players` WHERE `name` = '"..name.."';")
            db.executeQuery("INSERT INTO `delete_log`(`name`) VALUES ('"..name.."');")

            if cid ~= nil and isPlayer(cid) then
                doRemoveCreature(cid)
            end

            if not(result_plr:next()) then
                break
            end
        end
        result_plr:free()
    end


    return TRUE
end