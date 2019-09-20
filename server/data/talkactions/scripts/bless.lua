function onSay(cid, words, param)
    if getPlayerBless(cid, 1) or getPlayerBless(cid, 2) or getPlayerBless(cid, 3) or getPlayerBless(cid, 4) or getPlayerBless(cid, 5) then
        doPlayerSendCancel(cid,'You have already got one or more blessings!')
    else
        if doPlayerRemoveMoney(cid, 50000) == TRUE then
            doPlayerAddBless(cid, 1)
            doPlayerAddBless(cid, 2)
            doPlayerAddBless(cid, 3)
            doPlayerAddBless(cid, 4)
            doPlayerAddBless(cid, 5)
			doSendMagicEffect(getPlayerPosition(cid), CONST_ME_HOLYDAMAGE)
            doPlayerSendTextMessage(cid,MESSAGE_EVENT_ADVANCE,'You have been blessed by the gods!')
        else
            doPlayerSendCancel(cid, "You need 50k to get blessed!")
        end
    end    
    return 1
end
