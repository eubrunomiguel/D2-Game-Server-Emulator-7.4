function onEquip(cid, item, slot)
doTransformItem(item.uid, 2123, 1)
doPlayerSendTextMessage(cid, 22, 'Agora ganha 2x mais experiencia!')
doPlayerSetExperienceRate(cid, getConfigValue("rateExperience")*9.2)



return TRUE
end

function onDeEquip(cid, item, slot)
doTransformItem(item.uid, 7708, 1)
doPlayerSendTextMessage(cid, 22, 'Experiencia extra cancelada.')
doPlayerSetExperienceRate(cid, 1)


return TRUE
end