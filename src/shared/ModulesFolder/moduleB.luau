local moduleB = {}
function moduleB.PrintMessage()
	print("This module script has been called: ModuleB")
end

function moduleB.Table5jits()
	local table5jits = {}
	table5jits["Player1"] = "jonas"
	table5jits["Player2"] = "Acerbi"
	table5jits["Player3"] = "Luka"
	table5jits["Player4"] = "Jordi"
	table5jits["Player5"] = "Sergio"
	return table5jits
end
return moduleB
