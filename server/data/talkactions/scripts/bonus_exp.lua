function onSay(cid, words, param)

if isBonusActive() then
setBonusExp(false)
broadcastMessage("Double experience event is over.")
else
setBonusExp(true)
broadcastMessage("Double experience event is activated. Enjoy!")
end

end