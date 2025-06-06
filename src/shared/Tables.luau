local tablesModule = {}
local partTable = {}
print("this table has been called: Tables")
function tablesModule.partCreation()
	for i = 1, 5 do
		local part = Instance.new("Part")
		part.Name = "Part" .. i
		part.Size = Vector3.new(3, 3, 3)
		part.Position = Vector3.new(i * 5, i * 5, i * 5)
		part.Anchored = true
		part.Color = Color3.new(math.random(), math.random(), math.random())
		partTable[i] = part
		part.Parent = workspace
	end
end

function tablesModule.getPartTable()
	return partTable
end
return tablesModule
