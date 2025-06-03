print("BasicCalculator module loaded")
local BasicCalculator = {}

function BasicCalculator.add(a, b)
	local result = a + b
	return result
end
function BasicCalculator.subtract(a, b)
	local result = a - b
	return result
end
function BasicCalculator.multiply(a, b)
	local result = a * b
	return result
end
function BasicCalculator.divide(a, b)
	local result = a / b
	return result
end

return BasicCalculator
