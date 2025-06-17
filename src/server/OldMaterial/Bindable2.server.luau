local bindableEvent = game.ReplicatedStorage.Shared:WaitForChild("BindableEvent")

bindableEvent.Event:Connect(function(...)
	print("BindableEvent has been fired!")
	local arguments = { ... }

	for i, v in pairs(arguments) do
		print(v)
	end
end)
