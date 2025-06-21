local Debounce = {}
Debounce.__index = Debounce

function Debounce.new()
	return setmetatable({ _Last = os.clock() }, Debounce)
end

function Debounce:Can(Time): boolean
	local Now = os.clock()
	if Now - self._Last >= Time then
		self._Last = Now
		return true
	end
	return false
end

return Debounce
