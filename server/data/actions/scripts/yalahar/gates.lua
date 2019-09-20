local yalaharArenas = 
{
	[54000] = { message = "Good luck!", toPos = {x = 32272, y = 31099, z = 5} },
	[54001] = { message = "Good luck!", toPos = {x = 32275, y = 31099, z = 5} },
	[54002] = { message = "Good luck!", toPos = {x = 32287, y = 31059, z = 5} },
	[54003] = { message = "Good luck!", toPos = {x = 32287, y = 31062, z = 5} },
	[54004] = { message = "Good luck!", toPos = {x = 32319, y = 31040, z = 5} },
	[54005] = { message = "Good luck!", toPos = {x = 32319, y = 31042, z = 5} },
	[54006] = { message = "Good luck!", toPos = {x = 32415, y = 31099, z = 5}},
	[54007] = { message = "Good luck!", toPos = {x = 32412, y = 31099, z = 5}}

}

function onUse(cid, item, fromPosition, itemEx, toPosition)
    local gate = yalaharArenas[item.uid]
    if gate ~= nil then
		local currentArena = yalaharArenas[item.uid]
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, currentArena.message)
		doTeleportThing(cid, currentArena.toPos)
		doSendMagicEffect(getPlayerPosition(cid), CONST_ME_POFF)
	end
	return true
end