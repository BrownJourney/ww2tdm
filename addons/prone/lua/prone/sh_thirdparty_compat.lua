hook.Add("prone.CanEnter", "prone.CanEnterWW2", function(ply)
	if ply:InVehicle() then
		return false
	end

	return gamestate.Get() == GS_ROUND_PLAYING or gamestate.Get() == GS_WAITING_PLAYERS
end)