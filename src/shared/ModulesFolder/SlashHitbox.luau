local TweenService = game:GetService("TweenService")
local ServerStorage = game:GetService("ServerStorage")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local HitDetection = require(ReplicatedStorage.Shared.ModulesFolder.HitDetection)
--local Debris = game:GetService("Debris")
local SlashHitbox = {}

local function tweenHitbox(hitbox)
	for _, part in ipairs(hitbox:GetDescendants()) do
		if part:IsA("BasePart") and part.Name ~= "MainPart" then
			local weldConst = Instance.new("WeldConstraint")
			weldConst.Part0 = hitbox.PrimaryPart
			weldConst.Part1 = part
			weldConst.Parent = hitbox.PrimaryPart
			part.Anchored = false
			part.CanCollide = false
		end
	end
	hitbox.PrimaryPart.Anchored = true

	local tweenInfo = TweenInfo.new(1, Enum.EasingStyle.Linear)
	local offset = CFrame.new(0, 0, -20) -- Move the hitbox back by 5 studs
	local goal = {
		CFrame = hitbox.PrimaryPart.CFrame * offset,
	}
	local tween = TweenService:Create(hitbox.PrimaryPart, tweenInfo, goal)
	tween:Play()
	tween.Completed:Connect(function()
		if hitbox and hitbox:IsDescendantOf(workspace) then
			hitbox:Destroy()
		end
	end)
end

SlashHitbox.fireHitbox = function(player)
	local character = player.Character
	local slashHitbox = ServerStorage:WaitForChild("SlashHitbox"):Clone()
	HitDetection.connect(slashHitbox, 10)
	if not character then
		return
	end
	local rootPart = character:FindFirstChild("HumanoidRootPart")
	if not rootPart then
		print("No HumanoidRootPart found for player: " .. player.Name)
		return
	end

	local forwardOffset = 5
	local spawnPosition = rootPart.Position + (rootPart.CFrame.LookVector * forwardOffset)

	if not slashHitbox.PrimaryPart then
		print("Model does not have a PrimaryPart set.")
		return
	end

	--align the model's position with the spawn position
	slashHitbox:SetPrimaryPartCFrame(CFrame.new(spawnPosition, spawnPosition + rootPart.CFrame.LookVector))
	slashHitbox.Parent = workspace
	tweenHitbox(slashHitbox)
end

return SlashHitbox
