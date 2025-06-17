print("This module script has been called: PartSpawn")
local modulePartSpawn = {}

function modulePartSpawn.spawnPart(partName: string, sizeVector, positionVector, color)
	local part = Instance.new("Part")
	part.Name = partName
	part.Size = sizeVector
	part.Position = positionVector
	part.Anchored = true
	part.Color = color
	part.Parent = workspace
end

return modulePartSpawn
