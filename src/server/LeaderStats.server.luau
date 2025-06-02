game.Players.PlayerAdded:Connect(function(plr)
	local leaderstats = Instance.new("Folder", plr)
	leaderstats.Name = "leaderstats"

	local coins = Instance.new("IntValue", leaderstats)
	coins.Name = "Coins"
	coins.Value = 25
end) -- this is good

local DoubloonsEvent = game.ReplicatedStorage.Shared.RemoteEvents.GiveDoubloons

DoubloonsEvent.OnServerEvent:Connect(function(plr)
	local leaderstats = plr.leaderstats
	local coins = leaderstats.Coins

	coins.Value += 10
end)

local blockPrices = {
	red = 50,
	blue = 75,
	green = 25,
}

local BuyObjectRemote = game.ReplicatedStorage.Shared.RemoteFunctions.BuyObject
--onServerEvent(plr, arguments, etc)-very similar
BuyObjectRemote.OnServerInvoke = function(plr, color)
	local purchaseSuccessful = false

	--NOTE: if this has a runtime error, then use findFirstChild("Leaderstats")
	--same goes for ("Coins") below

	local leaderstats = plr.leaderstats
	--if not leaderstats then return false end

	local coins = leaderstats.Coins
	--if not coins then return false end

	local price = blockPrices[color]
	if not price then
		return false
	end

	if coins.Value >= price then
		coins.Value -= price
		purchaseSuccessful = true
	end
	return purchaseSuccessful
end -- no end parenthesis

-- remote functions code successfully completed, however got to implement the tooling bits correctly, perhaps tmrw
