local Tunnel = module('_core', 'lib/Tunnel')
local Proxy = module('_core', 'lib/Proxy')

API = Proxy.getInterface('API')
cAPI = Tunnel.getInterface('API')

local locations = {
    ['annesburg'] = {2939.041,1275.218,44.636},
    ['armadillo'] = {-3735.888,-2607.862,-12.882},
    ['blackwater'] = {-703.507,-1243.132,44.720},
    ['rhodes'] = {1222.140,-1299.043,76.897},
    ['st_dennis'] = {2678.500,-1463.101,46.280},
    ['valentine'] = {-172.313,627.119,114.032},
}

RegisterNetEvent("FRP:LOGIN:LoginMenu")
AddEventHandler("FRP:LOGIN:LoginMenu",function(cid)
    local _source = source
	local charid = cid

    if API.isCharIdLogged(charid) then
        TriggerClientEvent("FRP:LOGIN:reloglocation",_source,charid)
    else
        TriggerClientEvent("FRP:LOGIN:LoginMenu", _source, charid)
    end

end)


RegisterServerEvent("FRP:LOGIN:spawnlocation")
AddEventHandler("FRP:LOGIN:spawnlocation",function(cid,loc)
        local _source = source
        local User = API.getUserFromSource(_source)

        local locposition = locations[loc]
        if locposition ~= nil then
            local encoded = json.encode({ locposition[1], locposition[2], locposition[3] })
            User:setCharacterData(cid, "metaData", "position", encoded)
        else
            local pos = User:getCharacterData(cid, "metaData", "position")
            locposition = json.decode(pos)
        end

        cAPI.SetPlayerPosition(_source, locposition[1] or 0, locposition[2] or 0, locposition[3] or 0)

        User:setCharacter(cid)

    end
)
