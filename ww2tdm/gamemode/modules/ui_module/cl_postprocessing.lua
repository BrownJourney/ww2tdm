--[[-------------------------------------------------------------------------
Script was kindly provided by Dzhambolat.
---------------------------------------------------------------------------]]

local mat_color = Material( "pp/colour" )
local ww2_fisheyetexture = Material( "models/props_c17/fisheyelens" )

local contrast = 0.8
local color = 0.8
local clr_r = 0
local clr_g = 0
local clr_b = 0
local bloommul = 1
local add_r = 0
local add_b = 0
local add_g = 0
local brightness = 0

local function PostProcessing()
  	if ( IsValid( LocalPlayer() ) ) then

  		local newColor;

  	  	if ( LocalPlayer():Alive() ) then
  	  	  	newColor = math.Clamp(color - (color - color * (LocalPlayer():Health() / LocalPlayer():GetMaxHealth() )), 0, 1 )
  	  	else
  	  	  	newColor = 0
  	  	end

  	  	if ( LocalPlayer():WaterLevel() > 2 ) then

  	  		DrawMotionBlur( 0.2, 0.8, 0.01 )

  	  	end

  	  	render.UpdateScreenEffectTexture()

	   	mat_color:SetFloat( "$pp_colour_contrast", contrast )
	  	mat_color:SetFloat( "$pp_colour_colour", newColor )
	  	mat_color:SetFloat( "$pp_colour_mulr", clr_r )
	  	mat_color:SetFloat( "$pp_colour_mulg", clr_g )
	  	mat_color:SetFloat( "$pp_colour_mulb", clr_b )
	  	mat_color:SetFloat( "$pp_colour_addr", add_r )
	  	mat_color:SetFloat( "$pp_colour_addg", add_g )
	  	mat_color:SetFloat( "$pp_colour_addb", add_b )

  	  	render.SetMaterial( mat_color )
  	  	render.DrawScreenQuad()

  	  	DrawBloom( 0.65, bloommul, 9, 9, 1, 1, 1, 1, 1 )
  	  	DrawSharpen( 1.2, 0.3 )
  	  	DrawToyTown( 2, ScrH() / 3 )

  	  	if LocalPlayer():GetNWInt('Confusion', 0) >= CurTime() then
  	  		DrawMotionBlur( 0.2, 0.8, 0.01 )
  	  		DrawSharpen( 6.2, 0.3 )
  	  		-- LocalPlayer():SetDSP(35)
  	  	else
  	  		LocalPlayer():SetDSP(0, true)
  	  	end

  	end
end

hook.Add('RenderScreenspaceEffects', 'WW2_PostProcessing', PostProcessing)