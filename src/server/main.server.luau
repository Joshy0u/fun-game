-- task-1
print("before")

-- task-2
task.defer(function()
	print("defer")
end)

-- task-3
for i = 1, 10 do
	print("forloop 1")
end

-- task-3
print("after")
