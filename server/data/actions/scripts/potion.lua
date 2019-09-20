local discount = {[1] = {required = 1000, amount = 5},
				  [2] = {required = 2000, amount = 7},
				  [3] = {required = 3000, amount = 9},
				  [4] = {required = 4000, amount = 10},
				  [5] = {required = 5000, amount = 12},
				  [6] = {required = 6000, amount = 14},
				  [7] = {required = 7000, amount = 16},
				  [8] = {required = 8000, amount = 18},
				  [9] = {required = 9000, amount = 19},
				  [10] = {required = 10000, amount = 20}}
				  
function onUse(cid, item, fromPosition, itemEx, toPosition)
		
	local price = 1100
	for disc = #discount,1,-1 do
		if(getPlayerRunesMade(cid) >= discount[disc].required) then
		price =  price *(1 - discount[disc].amount/100)
		break
		end
    end
		
	if(getPlayerFreeCap(cid) < 54) then
		doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need at least 54.00 oz to buy a backpack of mana fluid.")
		return true
	end

			if getPlayerMoney(cid) >= price then
            brown_bp = doPlayerAddItem(cid, 2002, 1)
for i = 1,20 do
doAddContainerItem(brown_bp, 2006, 7)
end
				doPlayerRemoveMoney(cid, price)
  doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You have bought a backpack of mana fluid for " .. price .." gold coins.")
else
  doPlayerSendTextMessage(cid, MESSAGE_INFO_DESCR, "You need " .. price .." gps to buy a backpack of mana fluid.")
  end

	if item.itemid == 1945 then
		doTransformItem(item.uid, 1946)
	elseif item.itemid == 1946 then
		doTransformItem(item.uid, 1945)
	end					 
	return true
end