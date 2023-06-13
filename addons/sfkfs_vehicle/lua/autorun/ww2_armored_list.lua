local V = {
	Name = "Armored WW2 vehicle",
	Model = "models/ww2/vehicles/ger/sdkfz/sdkfz.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",

	Members = {
		Mass = 5000,
		
		LightsTable = "elitejeep",
		
		FrontWheelRadius = 15,
		RearWheelRadius = 15,
		
		SeatOffset = Vector(20,-15,63),
		SeatYaw = 90,
		SeatPitch = 0,

		EnginePos = Vector(0,75,65),

		MaxHealth = 2500,
		
		PassengerSeats = {
			{
				pos = Vector(0,0.5,55),
				ang = Angle(0, -90, 0)
			},
			{
				pos = Vector(-25,-20,40),
				ang = Angle(0, 0, 0)
			},
			{
				pos = Vector(-60,20,40),
				ang = Angle(0, 180, 0)
			},
		},

		OnSpawn = 
			function(ent)
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,

		IsArmored = true,
		NoWheelGibs = true,
		
		Backfire = true,
		ExhaustPositions = {
			{
				pos = Vector(-15.69,-105.94,14.94),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(16.78,-105.46,14.35),
				ang = Angle(90,-90,0)
			}
		},

		CustomWheels = true,
		CustomSuspensionTravel = 10,
			
		CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		-- CustomWheelModel = "models/ww2/vehicles/ww2_f_wheel.mdl",
		
		CustomWheelPosFL = Vector(100,40,15),
		CustomWheelPosFR = Vector(100,-40,15),
		-- CustomWheelPosML = Vector(-20,0,20),
		-- CustomWheelPosMR = Vector(50,0,32),
		CustomWheelPosRL = Vector(-50,40,15),
		CustomWheelPosRR = Vector(-50,-40,15),
		CustomWheelAngleOffset = Angle(0,0,0),

		CustomMassCenter = Vector(-20,0,20),
		
		CustomSteerAngle = 60,

		FrontHeight = 15,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 15,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3,
		
		MaxGrip = 1000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3500,
		PeakTorque = 780,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-53.14,-143.23,71.42),
		FuelType = FUELTYPE_DIESEL,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		snd_pitch = 1,
		snd_idle = "ww2/vehicle/zis5/zis5_idle.wav",
 
		snd_low = "ww2/vehicle/zis5/zis5_full.wav",
		snd_low_revdown = "ww2/vehicle/zis5/zis5_full.wav",
		snd_low_pitch = 0.9,
 
		snd_mid = "ww2/vehicle/zis5/zis5_idle.wav",
		snd_mid_gearup = "ww2/vehicle/zis5/zis5_idle.wav",
		snd_mid_pitch = 1,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_ww2_sdkfz", V )

V = {
	Name = "Armored WW2 vehicle #2",
	Model = "models/ww2/vehicles/sov/m3a1/m3a1.mdl",
	Class = "gmod_sent_vehicle_fphysics_base",
	Category = "Armed Vehicles",

	Members = {
		Mass = 6000,
		
		LightsTable = "elitejeep",
		
		FrontWheelRadius = 25,
		RearWheelRadius = 25,
		
		SeatOffset = Vector(-15,-20,65),
		SeatYaw = 90,
		SeatPitch = 0,

		EnginePos = Vector(0,75,65),

		MaxHealth = 2500,
		
		PassengerSeats = {
			{
				pos = Vector(-25,0.5,60),
				ang = Angle(0, -90, 0)
			},
			{
				pos = Vector(-25,-20,40),
				ang = Angle(0, 0, 0)
			},
			{
				pos = Vector(-60,20,40),
				ang = Angle(0, 180, 0)
			},
		},

		OnSpawn = 
			function(ent)
				ent:SetNWBool( "simfphys_NoRacingHud", true )
				ent:SetNWBool( "simfphys_NoHud", true ) 
			end,

		IsArmored = true,
		NoWheelGibs = true,
		
		Backfire = true,
		ExhaustPositions = {
			{
				pos = Vector(-15.69,-105.94,14.94),
				ang = Angle(90,-90,0)
			},
			{
				pos = Vector(16.78,-105.46,14.35),
				ang = Angle(90,-90,0)
			}
		},

		CustomWheels = true,
		CustomSuspensionTravel = 10,
			
		-- CustomWheelModel = "models/props_c17/canisterchunk01g.mdl",
		CustomWheelModel = "models/ww2/vehicles/ww2_f_wheel.mdl",
		
		CustomWheelPosFL = Vector(75,35,25),
		CustomWheelPosFR = Vector(75,-35,25),
		-- CustomWheelPosML = Vector(-20,0,20),
		-- CustomWheelPosMR = Vector(50,0,32),
		CustomWheelPosRL = Vector(-60,35,25),
		CustomWheelPosRR = Vector(-60,-35,25),
		CustomWheelAngleOffset = Angle(0,0,0),

		CustomMassCenter = Vector(-20,0,20),
		
		CustomSteerAngle = 60,

		FrontHeight = 25,
		FrontConstant = 50000,
		FrontDamping = 30000,
		FrontRelativeDamping = 300000,
		
		RearHeight = 25,
		RearConstant = 50000,
		RearDamping = 20000,
		RearRelativeDamping = 20000,
		
		FastSteeringAngle = 20,
		SteeringFadeFastSpeed = 300,
		
		TurnSpeed = 3,
		
		MaxGrip = 1000,
		Efficiency = 1,
		GripOffset = -500,
		BrakePower = 450,
		BulletProofTires = true,
		
		IdleRPM = 600,
		LimitRPM = 3500,
		PeakTorque = 780,
		PowerbandStart = 600,
		PowerbandEnd = 2600,
		Turbocharged = false,
		Supercharged = false,
		DoNotStall = true,
		
		FuelFillPos = Vector(-53.14,-143.23,71.42),
		FuelType = FUELTYPE_DIESEL,
		
		PowerBias = -0.3,
		
		EngineSoundPreset = 0,
		
		snd_pitch = 1,
		snd_idle = "ww2/vehicle/zis5/zis5_idle.wav",
 
		snd_low = "ww2/vehicle/zis5/zis5_full.wav",
		snd_low_revdown = "ww2/vehicle/zis5/zis5_full.wav",
		snd_low_pitch = 0.9,
 
		snd_mid = "ww2/vehicle/zis5/zis5_idle.wav",
		snd_mid_gearup = "ww2/vehicle/zis5/zis5_idle.wav",
		snd_mid_pitch = 1,
		
		Sound_Throttle = "",
		Sound_ThrottlePitch = 0,
		Sound_ThrottleVolume = 0,
		
		snd_horn = "common/null.wav",
		ForceTransmission = 1,
		
		DifferentialGear = 0.4,
		Gears = {-0.06,0,0.06,0.08,0.1,0.12,0.13}
	}
}
list.Set( "simfphys_vehicles", "sim_fphys_ww2_m3a1", V )