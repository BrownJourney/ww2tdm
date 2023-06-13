
teams = teams or {}

local PLAYER = FindMetaTable("Player")

function PLAYER:CanSpectate()

	return self:IsPremium()

end

function teams.GetDifference()

	return math.abs(#team.GetPlayers(TEAM_AXIS) - #team.GetPlayers(TEAM_ALLIES))

end

function teams.GetDifferenceDirect(teamID)

	if teamID == TEAM_AXIS then

		return #team.GetPlayers(TEAM_AXIS) - #team.GetPlayers(TEAM_ALLIES)

	else

		return #team.GetPlayers(TEAM_ALLIES) - #team.GetPlayers(TEAM_AXIS)

	end

	return 0

end

function teams.GetPlayers(teamID)

	local teamTable = {}

	for k, v in pairs(team.GetPlayers(teamID) or {}) do

		if v:IsPremium() then

			continue

		end

		table.insert(teamTable, v)

	end

	return teamTable

end