local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Players = game:GetService("Players")
local weldingModule = require(ReplicatedStorage.Shared.ModulesFolder.WeldScript)
local KatanaEvent = ReplicatedStorage.Shared.RemoteEvents:WaitForChild("KatanaDetected")

game.Players.PlayerAdded:Connect(function(player)
	player.CharacterAdded:Connect(function(character)
		local katana = ServerStorage:WaitForChild("Katana"):Clone()
		local handle = katana:WaitForChild("Handle")
		local blade = katana:WaitForChild("KatanaMesh")
		katana.Parent = player.Backpack

		weldingModule.weldParts(handle, blade)
		KatanaEvent.OnServerEvent:Connect(function()
			print("server sided katana firing has been detected for player: " .. player.Name)
		end)

		-- so now i need to implement the slash hitbox somehow...
	end)
end)
--couple fixes need to be done, i got the filepath completely wrong so thats silly of me.
--also i need katana to be  a tool with teh welding of mesh and handle inside of it
