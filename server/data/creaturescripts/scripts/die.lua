function onDie(cid, corpse)
	if isPlayer(cid)  then
		-- Remove all blesses
		-- We can not remove blesses now, since onDie is called before removing experience
		-- So we will set storage to remove in onLogin
		setPlayerStorageValue(cid, STORAGE_REMOVE_BLESSES, 1)

		-- if a player dies, set storage value to add bag at the relogin
		if isBlessed(cid) then
			setPlayerStorageValue(cid, STORAGE_DEATH_BAG, 1)
		end

		-- save please
		doSavePlayer(cid)
	end
end