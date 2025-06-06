local Modules = {}
local ModulesFolder = script.Parent:WaitForChild("ModulesFolder")

for _, moduleScript in ipairs(ModulesFolder:GetChildren()) do --within the folder get all children
	if moduleScript:IsA("ModuleScript") then --check if the child is a ModuleScript
		print(moduleScript.Name .. " Is a confirmed module")
		Modules[moduleScript.Name] = require(moduleScript)
		-- require(aka store the return into the table, which is the functions of code)
	end
end
return Modules
