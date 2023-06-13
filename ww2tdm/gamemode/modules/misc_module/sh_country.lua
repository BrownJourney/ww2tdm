if SERVER then
	
	util.AddNetworkString("UpdatePlayerCountry")
	net.Receive("UpdatePlayerCountry", function(len, ply)
		if ply.countrySet then return end

		local isoCode = net.ReadString()
		ply:SetNetString("ISO-Country", isoCode)

		ply.countrySet = true
	end)

end