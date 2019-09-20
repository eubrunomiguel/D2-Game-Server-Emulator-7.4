function onTime(interval, lastExecution)
	local today = os.date ("%A")
	local day = "Sunday"
	local sameday = (today == day and true or false)
	if sameday then
		return enableEvent(math.abs(math.ceil(5)))
	else
		return true
	end
end
