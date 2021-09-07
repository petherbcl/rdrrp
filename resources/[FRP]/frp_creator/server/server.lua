local Tunnel = module('_core', 'lib/Tunnel')
local Proxy = module('_core', 'lib/Proxy')

API = Proxy.getInterface('API')
cAPI = Tunnel.getInterface('API')

RegisterNetEvent('PersonaCreatorHandler.requestCreatePersona')
AddEventHandler('PersonaCreatorHandler.requestCreatePersona', function(playerProfileCreation)
    local _source = source
    local User = API.getUserFromSource(_source)

    local Character = User:createCharacter(playerProfileCreation.name, playerProfileCreation.age, playerProfileCreation.isMale)

    if Character ~= nil then
                
        Character:createAppearance(Character:getId(), playerProfileCreation)

        Character:setData(Character:getId(), "metaData", "hunger", 100)
        Character:setData(Character:getId(), "metaData", "thirst", 100)
        Character:setData(Character:getId(), "metaData", "banco", 0)

        local encoded = json.encode({-1099.470,-1839.129,60.327})
        Character:setData(Character:getId(), "metaData", "position", encoded)       
        User:setCharacter(Character:getId()) -- Will draw itself      
    end

    Wait(1000)

    TriggerClientEvent('FRP:CREATOR:FirstSpawn', _source)

end)
