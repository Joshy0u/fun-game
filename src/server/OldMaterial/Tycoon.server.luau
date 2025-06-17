local Players = game:GetService("Players")
local ServerStorage = game:GetService("ServerStorage")

local TycoonModel = ServerStorage:WaitForChild("Tycoon")

Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local tycoonClone = TycoonModel:Clone()
		tycoonClone.Parent = player
		tycoonClone.Name = player.Name .. "'s Tycoon"
		tycoonClone:SetPrimaryPartCFrame(CFrame.new(0, 10, 0)) -- Set initial position
	end)
end)
