local loopThread = coroutine.create(function()
	for i = 1, 10 do
		print(i)
		coroutine.yield() -- this yield will stop each time the resume is called
	end
end)

coroutine.resume(loopThread)

print("execution has stopped")
coroutine.resume(loopThread) -- go back
