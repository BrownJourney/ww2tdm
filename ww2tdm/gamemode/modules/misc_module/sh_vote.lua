
vote = vote or {}

VOTE_KICK = "kick"
VOTE_KICK_ROLE  = "ban"

VOTE_DURATION = 20
VOTE_MIN_COEF = 1.25
VOTE_COOLDOWN = 120

vote.Ongoing = {}
vote.TeamsCooldown = {}

local PLAYER = FindMetaTable("Player")

function PLAYER:CanInitiateVote()

	return true

end

if (SERVER) then

	function vote.Start(initiator, plyname, votetype)

		local teamID = initiator:Team()

		local ply = player.GetByName(plyname)

		if ( not IsValid(ply) ) then

			notify.Add(initiator, "player_notfound", "player_notfound_desc", 3)
			return

		end

		if ( ply == initiator ) then

			notify.Add(initiator, "player_kickhimself", nil, 3)
			return

		end

		if ( ply:Team() ~= teamID ) then

			return

		end

		if ( ply:IsPremium() ) then

			notify.Add(initiator, "player_premium", nil, 3)
			return

		end

		if ( ( vote.TeamsCooldown[teamID] or 0 ) >= CurTime() ) then

			notify.Add(initiator, "vote_recently", nil, 3)
			return

		end

		vote.TeamsCooldown[teamID] = CurTime() + VOTE_COOLDOWN

		ShowMessageTo(team.GetPlayers(teamID), team.GetColor(teamID), initiator:Name(), color_white, " начал голосование против " .. ply:Name() .. "!")

		vote.Ongoing[teamID] = { ply = ply, y = 0, n = 1, voters = table.Count( team.GetPlayers( teamID ) ), participated = {} }

		vote.CreateMenu(initiator, votetype, plyname)

		timer.Create( "EndVote", VOTE_DURATION, 1, function()

			vote.Finish(ply, votetype)

		end )

	end

	util.AddNetworkString("CreateVotePanel")

	function vote.CreateMenu(initiator, votetype, plyname)

		net.Start("CreateVotePanel")

			net.WriteString(plyname)
			net.WriteString(votetype)

		net.Send( team.GetPlayers( initiator:Team() ) )

	end

	function vote.IsPlayerOnVote(ply)

		local teamID = ply:Team()

		if ( not vote.Ongoing[teamID] ) then

			return false

		end

		return vote.Ongoing[teamID].ply == ply

	end

	function vote.Finish(ply, votetype)

		if !IsValid(ply) then

			return

		end

		local teamID = ply:Team()

		local voteData = vote.Ongoing[teamID]

		if ( not voteData ) then

			return

		end

		local yes, no = voteData.y, voteData.n

		local shouldBeKicked = yes / no > VOTE_MIN_COEF and yes + no > math.floor( voteData.voters / 2 )

		if ( shouldBeKicked ) then

			if ( votetype == VOTE_KICK ) then

				ShowMessageTo(team.GetPlayers(teamID), team.GetColor(teamID), ply:Name(), color_white, " был выгнан с сервера с помощью голосования!")
				AC.KickPlayer(ply, "Kicked due to community voting", 1)

			elseif ( votetype == VOTE_KICK_ROLE ) then

				ply:SelectClass(BASE_CLASS)
				ShowMessageTo(team.GetPlayers(teamID), team.GetColor(teamID), ply:Name(), color_white, " был выгнан с роли!")

			end

		end

		vote.Ongoing = {}

	end

	util.AddNetworkString("VoteUpdateNumbers")

	function vote.PlayerVoted(ply, isPositive)

		local teamID = ply:Team()

		if ( not vote.Ongoing[teamID] ) then

			return

		end

		if ( vote.Ongoing[teamID].ply == ply ) then

			return

		end

		-- never trust the fucking client
		if ( vote.Ongoing[teamID].participated[ply] ) then

			return

		end

		local keyAdd = isPositive and "y" or "n"
		vote.Ongoing[teamID][keyAdd] = vote.Ongoing[teamID][keyAdd] + 1

		net.Start("VoteUpdateNumbers")

			net.WriteUInt(vote.Ongoing[teamID].y, 5)
			net.WriteUInt(vote.Ongoing[teamID].n, 5)

		net.Send( team.GetPlayers(teamID) )

		vote.Ongoing[teamID].participated[ply] = true

	end


	util.AddNetworkString("VotePlayer")
	net.Receive( "VotePlayer", function(len, ply)

		local tarname 	= net.ReadString()
		local votetype 	= net.ReadString()

		vote.Start(ply, tarname, votetype)

	end )

	util.AddNetworkString("VoteGiven")
	net.Receive( "VoteGiven", function(len, ply)

		local isPositive = net.ReadBool()

		vote.PlayerVoted(ply, isPositive)

	end )

end

if (CLIENT) then

	function vote.SendToServer(plyname, votetype)

		if ( not LocalPlayer():CanInitiateVote() ) then

			notify.Add("vote_cant", "nil", 5)
			return

		end

		net.Start("VotePlayer")

			net.WriteString(plyname)
			net.WriteString(votetype)

		net.SendToServer()

	end

	function vote.ShowMenu(guilty, votetype)

		local w, h = ScrW(), ScrH()

		local panel = vgui.Create("DPanel")
		panel:SetSize(w * 0.2, h * 0.1)
		panel:CenterHorizontal(0.5)
		panel:SetAlpha(0)
		panel:AlphaTo(255, 0.5)
		panel.Paint = function(self, w, h)

			draw.SimpleLinearGradientPanel(self, 0, 0, w, h, Color(0, 0, 0, 200), Color(100, 100, 100, 100))

			draw.SimpleTextShadow(T(votetype), F("futura_22"), w / 2, 0, color_white, TEXT_ALIGN_CENTER)
			draw.SimpleTextShadow(guilty, F("futura_26"), w / 2, h * 0.25, color_white, TEXT_ALIGN_CENTER)

			draw.SimpleTextShadow(vote.currentData.y, F("futura_20"), 5, h * 0.5, color_white)
			draw.SimpleTextShadow(vote.currentData.n, F("futura_20"), w - 5, h * 0.5, color_white, TEXT_ALIGN_RIGHT)

			local font = F("futura_25")
			draw.SimpleTextShadow(T("vote_yes"):format("F1"), font, 5, h, Color(50, 255, 50), nil, TEXT_ALIGN_BOTTOM)
			draw.SimpleTextShadow(T("vote_no"):format("F2"), font, w - 5, h, Color(255, 50, 50), TEXT_ALIGN_RIGHT, TEXT_ALIGN_BOTTOM)

			draw.SimpleTextShadow(T("seconds"):format(math.ceil(timer.TimeLeft("EndVote")) or VOTE_DURATION), F("futura_30"), w / 2, h, color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_BOTTOM)

			surface.SetDrawColor(255, 255, 255, 100)
			surface.DrawOutlinedRect(0, 0, w, h)

		end

		timer.Create( "EndVote", VOTE_DURATION - 0.5, 1, function()

			panel:Remove()
			vote.currentData = nil;

		end )

	end

	hook.Add( "PlayerButtonDown", "TrackPlayerVote", function(ply, butt)

		if ( not vote.currentData ) then

			return

		end
		
		if ( vote.pressed ) then

			return

		end

		if ( butt == KEY_F1 ) then

			net.Start("VoteGiven")
				net.WriteBool(true)
			net.SendToServer()

			vote.pressed = true

		elseif ( butt == KEY_F2 ) then

			net.Start("VoteGiven")
				net.WriteBool(false)
			net.SendToServer()

			vote.pressed = true

		end

	end )

	net.Receive( "CreateVotePanel", function()

		vote.currentData = {y = 0, n = 0}
		vote.pressed = false

		local guilty = net.ReadString()
		local votetype = net.ReadString()

		vote.ShowMenu(guilty, votetype)

	end )

	net.Receive( "VoteUpdateNumbers", function()

		local yes 	= net.ReadUInt(5)
		local no 	= net.ReadUInt(5)

		vote.currentData = {y = yes, n = no}

	end )

end