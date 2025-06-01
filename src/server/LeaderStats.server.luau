local greetPlayer = game.ReplicatedStorage.Shared.RemoteEvents.GreetPlayer
local giveAnnouncement = game.ReplicatedStorage.Shared.RemoteEvents.GiveAnnouncement

game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"

	local coins = Instance.new("IntValue", leaderstats)
	coins.Name = "Coins"
	coins.Value = 50

	greetPlayer:FireClient(plr, "Hello " .. plr.Name)
end) -- this is good

local giveCurrency = game.ReplicatedStorage.Shared.RemoteEvents.GiveCurrency

giveCurrency.OnServerEvent:Connect(function(player, coinsAmount) -- give the player that fired the event 50 coins
	local leaderstats = player.leaderstats
	local coins = leaderstats.Coins

	coins.Value += coinsAmount
end)

task.wait(20)
giveAnnouncement:FireAllClients()

--NOTE I DO NOT KNOW HOW TO MAKE SCRIPTS IN PLACES OUTSIDE serverScriptService, StarterPlayerScripts,
-- and ReplicatedStorage. I am not sure if this is possible.
--note the remote event indirectly will pass the player to the function, so the
-- "on server event" function must receive the player as a parameter.
