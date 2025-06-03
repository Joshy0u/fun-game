# Tweening a Part in Roblox with TweenService

This document explains how to animate a part in Roblox using the `TweenService`. Tweening is the process of creating smooth transitions between values over time. In Roblox, `TweenService` is used to animate properties of instances such as position, size, transparency, and more.

---

## 🧱 Script Breakdown

```lua
local TweenService = game:GetService("TweenService")
local part = script.Parent

local tweenInfo = TweenInfo.new(5, Enum.EasingStyle.Bounce, Enum.EasingDirection.Out)

local goal = {
    Position = Vector3.new(45, 2, 51),
    Size = Vector3.new(10, 10, 10)
}

local tween = TweenService:Create(part, tweenInfo, goal)

task.wait(2)
tween:Play()
tween.Completed:Wait()
print("this tween has been finished") 
```
### Following Code:
explains Enums/Functions/Events
```lua
TweenInfo.new(
    time: number,                     -- Duration of the tween in seconds
    easingStyle: Enum.EasingStyle,   -- Controls the shape of the motion curve
    easingDirection: Enum.EasingDirection, -- Controls the acceleration pattern
    repeatCount: number? = 0,        -- Number of times to repeat the tween
    reverses: boolean? = false,      -- Whether to reverse on repeat
    delayTime: number? = 0           -- Delay before the tween starts
)
```
