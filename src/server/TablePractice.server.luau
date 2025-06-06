local tableModule = require(game.ReplicatedStorage.Shared.Tables)

task.wait(3)
tableModule.partCreation()
local partTable = tableModule.getPartTable()
for i = 1, #partTable do
	print("Part Name: " .. partTable[i].Name)
end
