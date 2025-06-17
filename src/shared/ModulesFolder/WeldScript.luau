local weldingModule = {}

weldingModule.weldParts = function(partA, partB)
	local weld = Instance.new("WeldConstraint")
	weld.Part0 = partA
	weld.Part1 = partB
	weld.Parent = partA
end

return weldingModule
