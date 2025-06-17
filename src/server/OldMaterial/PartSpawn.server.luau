local modulePartSpawner = require(game.ReplicatedStorage.Shared.PartSpawn)
task.wait(3)

for i = 1, 10 do
	local randomSize = math.random(1, 10)
	local randomColor = Color3.new(math.random(0, 255), math.random(0, 255), math.random(0, 255))
	task.wait(1)
	modulePartSpawner.spawnPart(
		"Part" .. i,
		Vector3.new(randomSize, randomSize, randomSize),
		Vector3.new(i * 10, 0, 0),
		randomColor
	)
end
--note path directory needs to be changed inorder for these to work
