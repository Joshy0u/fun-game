local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local KatanaEvent = ReplicatedStorage.Shared.RemoteEvents:WaitForChild("KatanaDetected")

player.CharacterAdded:Connect(function(character)
	character.ChildAdded:Connect(function(child)
		if child.Name == "Katana" and child:IsA("Tool") and not child:GetAttribute("ClientConnected") then
			child:SetAttribute("ClientConnected", true)

			child.Activated:Connect(function()
				print("Katana activated for player: " .. player.Name)
				KatanaEvent:FireServer()
			end)
		end
	end)
end)
