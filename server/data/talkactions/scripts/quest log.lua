
function onSay(cid, words, param)
if getPlayerStorageValue(cid, 3035) >= 1 then
antidotequest = "[1/1]"
else
antidotequest = "[0/1]"
end
if getPlayerStorageValue(cid, 3034) >= 1 then
studdedshieldquest = "[1/1]"
else
studdedshieldquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3025) >= 1 then
legionhelmetquest = "[1/1]"
else
legionhelmetquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3030) >= 1 then
studdedlegsquest = "[1/1]"
else
studdedlegsquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3029) >= 1 then
pickquest = "[1/1]"
else
pickquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3028) >= 1 then
shortswordquest = "[1/1]"
else
shortswordquest = "[0/1]"
end
if getPlayerStorageValue(cid, 2999) >= 1 then
bearroomkeyquest = "[1/1]"
else
bearroomkeyquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3000) >= 1 then
bearroomquest = "[1/1]"
else
bearroomquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3005) >= 1 then
CaptainIgluesTreasureQuest = "[1/1]"
else
CaptainIgluesTreasureQuest = "[0/1]"
end
if getPlayerStorageValue(cid, 3008) >= 1 then
doubletquest = "[1/1]"
else
doubletquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3007) >= 1 then
combatknifequest = "[1/1]"
else
combatknifequest = "[0/1]"
end
if getPlayerStorageValue(cid, 3025) >= 1 then
dragoncorpsequest = "[1/1]"
else
dragoncorpsequest = "[0/1]"
end
if getPlayerStorageValue(cid, 3015) >= 1 then
gobblintemplequest = "[1/1]"
else
gobblintemplequest = "[0/1]"
end
if getPlayerStorageValue(cid, 3017) >= 1 then
katanaquest = "[1/1]"
else
katanaquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3022) >= 1 then
minotaurhellquest = "[1/1]"
else
minotaurhellquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3019) >= 1 then
rapierquest = "[1/1]"
else
rapierquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3027) >= 1 then
torchquest = "[1/1]"
else
torchquest = "[0/1]"
end
if getPlayerStorageValue(cid, 3026) >= 1 then
smallaxequest = "[1/1]"
else
smallaxequest = "[0/1]"
end
if getPlayerStorageValue(cid, 8000) >= 1 then
crusaderquest = "[1/1]"
else
crusaderquest = "[0/1]"
end
if getPlayerStorageValue(cid, 4502)>= 1 then
blackknightquest = "[1/1]"
else
blackknightquest = "[0/1]"
end
if getPlayerStorageValue(cid, 4004) >= 1 then
deeperfibulaquest = "[1/1]"
else
deeperfibulaquest = "[0/1]"
end
if getPlayerStorageValue(cid, 9500) >= 1 then
elvenbanequest = "[1/1]"
else
elvenbanequest = "[0/1]"
end
if getPlayerStorageValue(cid, 4507) >= 1 then
amazonquest = "[1/1]"
else
amazonquest = "[0/1]"
end
if getPlayerStorageValue(cid, 4506) >= 1 then
timeringquest = "[1/1]"
else
timeringquest = "[0/1]"
end
if getPlayerStorageValue(cid, 4500) >= 1 then
bloodherbquest = "[1/1]"
else
bloodherbquest = "[0/1]"
end
if getPlayerStorageValue(cid, 4012) >= 1 then
noblearmorquest = "[1/1]"
else
noblearmorquest = "[0/1]"
end


doShowTextDialog(cid, 1967, "~Quest log - Rookgaard~\n\nTorch -".. torchquest .."\nDoublet -".. doubletquest .."\nRapier -".. rapierquest .."\nCombat Knife -".. combatknifequest .."\nShort Sword -".. shortswordquest .."\nPick -".. pickquest .."\nSmall Axe -".. smallaxequest .."\nStudded Shield -".. studdedshieldquest .."\nAntidote Rune -".. antidotequest .."\nBear Room Key -".. bearroomkeyquest .."\nBear Room Quest -".. bearroomquest .."\nMinotaur Hell -".. minotaurhellquest .."\nLegion Helmet -".. legionhelmetquest .."\nStudded Legs -".. studdedlegsquest .."\nCaptain Iglues Treasure Quest -".. CaptainIgluesTreasureQuest .."\nGoblin Temple -".. gobblintemplequest .."\nDragon Corpse -".. dragoncorpsequest .."\nKatana -".. katanaquest .."\n\n\n~Quest log - Main~".."\n\nAmazon quest -".. amazonquest .."\nBlack Knight quest -".. blackknightquest .."\nBlood Herb quest -".. bloodherbquest .."\nCrusader Helmet Quest -".. crusaderquest .."\nDeeper Fibula quest -".. deeperfibulaquest .."\nElvenbane quest -".. elvenbanequest .."\nNoble Armor quest -".. noblearmorquest .."\nTime Ring quest -".. timeringquest .."")end




