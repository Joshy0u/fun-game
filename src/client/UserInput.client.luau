local UserInput = game:GetService("UserInputService")
local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local KatanaEvent = ReplicatedStorage.Shared.RemoteEvents:WaitForChild("KatanaDetected")

player.CharacterAdded:Connect(function(character)
	local katana = character:WaitForChild("Katana")
	katana.Equipped:Connect(function()
		print("Katana equipped")
		UserInput.InputBegan:Connect(function(input, gameProcessedEvent)
			if input.UserInputType == Enum.UserInputType.MouseButton1 and not gameProcessedEvent then
				print("Katana slash action triggered")
				KatanaEvent:FireServer()
				-- Here you can implement the logic for the slash hitbox
				-- For example, you could create a hitbox and check for collisions with other players or objects
				-- This is where you would handle the actual slash effect
			end
		end)
	end)
end)
