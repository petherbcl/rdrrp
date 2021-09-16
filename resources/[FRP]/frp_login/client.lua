-- St Dennis 2678.500,-1463.101,46.280
-- Rhodes 1222.140,-1299.043,76.897
-- Blackwater -703.507,-1243.132,44.720
-- Armadillo -3735.888,-2607.862,-12.882
-- Valentine -172.313,627.119,114.032
-- Annesburg 2939.041,1275.218,44.636


local Tunnel = module("_core", "lib/Tunnel")
local Proxy = module("_core", "lib/Proxy")

cAPI = Proxy.getInterface("API")
API = Tunnel.getInterface("API")
-------------------------------------------
-------------------------------------------

local menuactive = false
local charid = nil

function ToggleActionMenu()
	print(tostring(menuactive))
	menuactive = not menuactive
	if menuactive then
		SetNuiFocus(true,true)
		SendNUIMessage({ showmenu = true })
	else
		SetNuiFocus(false)
		SendNUIMessage({ hidemenu = true })
	end
end


RegisterNUICallback("ButtonClick",function(data,cb)
	TriggerServerEvent("FRP:LOGIN:spawnlocation",charid, data)
	ToggleActionMenu()

	local playerPed = PlayerPedId()
    --Wait(1500)
    SetFocusEntity(playerPed) 
    SetEntityInvincible(playerPed, false)
    SetEntityVisible(playerPed, true)
    NetworkSetEntityInvisibleToNetwork(playerPed, false)

	Wait(1500)
	cAPI.EndFade(500)
end)


-- EVENTO PARA MOSTRAR A OPÇÃO DE SPAWN
RegisterNetEvent("FRP:LOGIN:LoginMenu")
AddEventHandler("FRP:LOGIN:LoginMenu",function(cid)
	charid = cid
	ToggleActionMenu()
end)

RegisterNetEvent("FRP:LOGIN:reloglocation")
AddEventHandler("FRP:LOGIN:reloglocation",function(cid)
	TriggerServerEvent("FRP:LOGIN:spawnlocation",cid, "lastloc")

	local playerPed = PlayerPedId()
    --Wait(1500)
    SetFocusEntity(playerPed)
	NetworkSetEntityInvisibleToNetwork(playerPed, false)
    SetEntityInvincible(playerPed, false)
    SetEntityVisible(playerPed, true)
    
	Wait(1500)
	cAPI.EndFade(500)
end)



RegisterCommand("login",function()
	ToggleActionMenu()
end)
