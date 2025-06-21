--metatables give you more functionality, (not just powerful haha)
--heres a regular table
local myTable = { 30, 20, 10, 5 }

setmetatable(myTable, {
	__newindex = function(table, index, value)
		print("you just set index " .. tostring(index) .. " of the table to " .. tostring(value))
	end,
})
task.wait(4)
myTable[5] = "hey!"
-- newindex is a metamethod, is a method that is indirectly fired when u set an index of a table thats currently nil, to a fallback value
--so in this case myTable[5] isnt preent, and because we linked the metatable, we have a __newindex metamethod, and it will fire the print statement.
