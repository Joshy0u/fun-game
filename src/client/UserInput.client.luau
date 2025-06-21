local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local player = Players.LocalPlayer
local KatanaEvent = ReplicatedStorage.Shared.RemoteEvents:WaitForChild("KatanaDetected")
local UserInputService = game:GetService("UserInputService")

player.CharacterAdded:Connect(function(character)
	character.ChildAdded:Connect(function(child)
		if child.Name == "Katana" and child:IsA("Tool") and not child:GetAttribute("ClientConnected") then
			child:SetAttribute("ClientConnected", true)
			-- line above is to prevent multiple connections if the character respawns with the katana already in hand.
			local debounce = false
			local equipped = false

			child.Equipped:Connect(function()
				equipped = true
			end)
			child.Unequipped:Connect(function()
				equipped = false
			end)
			UserInputService.InputBegan:Connect(function(input, gameProcessedEvent)
				if gameProcessedEvent then
					return
				end
				if input.UserInputType == Enum.UserInputType.Keyboard and input.KeyCode == Enum.KeyCode.E then
					if equipped and not debounce then
						debounce = true
						print("HE SLASHED")
						KatanaEvent:FireServer()
						task.delay(0.1, function()
							debounce = false
						end)
					end
				end
			end)
		end
	end)
end)
--next step, change this to E key instead of left click: DONE!
