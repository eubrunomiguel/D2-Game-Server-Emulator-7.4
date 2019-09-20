function onEquip(cid, item, slot)
doPlayerSendTextMessage(cid, 22, 'Agora ganha 2x mais experiencia!')
setExperienceRate(cid, getConfigValue("rate_exp")*0.2)



return TRUE
end

function onDeEquip(cid, item, slot)
doPlayerSendTextMessage(cid, 22, 'Experiencia extra cancelada.')
setExperienceRate(cid, 1)
return TRUE
end
