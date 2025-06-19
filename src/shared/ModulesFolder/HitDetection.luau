local HitDetection = {}

function HitDetection.connect(hitbox, damage)
	for _, part in ipairs(hitbox:GetDescendants()) do
		if part:IsA("BasePart") then
			part.Touched:Connect(function(otherPart)
				local character = otherPart:FindFirstAncestorOfClass("Model")
				local humanoid = character and character:FindFirstChildOfClass("Humanoid")
				if humanoid and humanoid.Health > 0 then
					humanoid:TakeDamage(damage)
					print("Hit detected on " .. character.Name .. " with damage: " .. damage)
					-- Optionally, you can destroy the hitbox after a hit
					hitbox:Destroy()
				end
			end)
		end
	end
end

return HitDetection
