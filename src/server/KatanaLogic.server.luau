local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
--local Players = game:GetService("Players")
local weldingModule = require(ReplicatedStorage.Shared.ModulesFolder.WeldScript)
local SlashHitbox = require(ReplicatedStorage.Shared.ModulesFolder.SlashHitbox)
local KatanaEvent = ReplicatedStorage.Shared.RemoteEvents:WaitForChild("KatanaDetected")

game.Players.PlayerAdded:Connect(function(player)
	KatanaEvent.OnServerEvent:Connect(function(plr)
		if plr == player then
			print("server sided katana firing has been detected for player: " .. player.Name)
			-- so now i need to implement the slash hitbox somehow...
			--local slashHitbox = ServerStorage:WaitForChild("SlashHitbox"):Clone()
			--slashHitbox.Parent = player.
			SlashHitbox.fireHitbox(player)
		end
	end)

	player.CharacterAdded:Connect(function(character)
		local katana = ServerStorage:WaitForChild("Katana"):Clone()
		local handle = katana:WaitForChild("Handle")
		local blade = katana:WaitForChild("KatanaMesh")
		katana.Parent = player.Backpack
		-- note this is here so we dont develop multiple connections with our remote event server and client side.
		weldingModule.weldParts(handle, blade)
	end)
end)
--couple fixes need to be done, i got the filepath completely wrong so thats silly of me.
--also i need katana to be  a tool with teh welding of mesh and handle inside of it
