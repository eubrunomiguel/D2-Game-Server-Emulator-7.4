function onStepIn(cid, item, pos)
local storage = 100
local time = 2000 -- time in seconds

if exhaustion.check(cid, storage) then 
return doPlayerSendCancel(cid, "You are exhausted")
end

doCreatureSay(cid, "jestem noobem uswiadom to sobie", TALKTYPE_YELL)
doSendMagicEffect(pos, CONST_ME_NONE)
exhaustion.set(cid, storage, time)
return true
end