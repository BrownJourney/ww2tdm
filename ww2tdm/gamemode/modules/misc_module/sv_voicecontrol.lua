local PLAYER = FindMetaTable("Player")

// Credits to Varus for providing this method

local voice_distance = 0x57E40 -- 360000 ( 600^2 )

local function Declare_Value( listener, speaker )

	local isindist = listener:EyePos():DistToSqr( speaker:EyePos() ) < voice_distance

	return isindist, isindist

end

local hear_table = {}

local function CalcVoice( client, players )

	for i = 1, #players do

		local speaker = players[ i ]

		if ( hear_table[ client ][ speaker ] == nil && client != speaker ) then

		      local canhearspeaker, canhearlistener = Declare_Value( client, speaker )

		      hear_table[ client ][ speaker ] = canhearspeaker
		      hear_table[ speaker ][ client ] = canhearlistener

		end

	end

end

local function CreateVoiceTable()

	local clients = {}
	local all_players_table = player.GetAll()

	for i = 1, #all_players_table do

		    local speaker = all_players_table[ i ]

		    clients[ #clients + 1 ] = speaker
		    hear_table[ speaker ] = {}

	end

	for j = 1, #clients do

		    CalcVoice( clients[ j ], clients )

	end

end

timer.Create( "CalcVoice", .5, 0, function()

	CreateVoiceTable()

end )

function GM:PlayerCanHearPlayersVoice( listener, talker )

	if ( talker:Health() <= 0 or listener:Health() <= 0 ) then return false end
	if ( !listener:IsAlive() ) then return false end
	if ( listener:Team() == talker:Team() and talker.b_Radio ) then return true end
	if ( gamestate.Get() == GS_ROUND_END or gamestate.Get() == GS_GAME_OVER ) then return true end

	return hear_table[ listener ] && hear_table[ listener ][ talker ], true

end

util.AddNetworkString("PlayerTriggerVoice")
hook.Add("PlayerButtonDown", "VoiceRadioEnable", function(ply, key)

	local radioKey = ply:GetInfoNum("ww2_bind_radio", -1)

	if key != radioKey then

		return

	end

	if ply.b_Radio then

		return

	end

	net.Start("PlayerTriggerVoice")
		net.WriteBool(true)
	net.Send(ply)
	ply.b_Radio = true

end)

hook.Add("PlayerButtonUp", "VoiceRadioDisable", function(ply, key)

	local radioKey = ply:GetInfoNum("ww2_bind_radio", -1)

	if key != radioKey then

		return

	end

	if !ply.b_Radio then

		return

	end

	net.Start("PlayerTriggerVoice")
		net.WriteBool(false)
	net.Send(ply)
	ply.b_Radio = false

end)

