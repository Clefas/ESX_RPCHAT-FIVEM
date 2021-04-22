ESX = nil

Citizen.CreateThread(function()
    while ESX == nil do
        TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
        Citizen.Wait(0)
    end
end)

RegisterNetEvent('esx_rpchat:sendProximityMessage')
AddEventHandler('esx_rpchat:sendProximityMessage', function(playerId, title, message, color)
	local player = PlayerId()
	local target = GetPlayerFromServerId(playerId)
	if target ~= -1 then
      local playerPed = PlayerPedId()
      local targetPed = GetPlayerPed(target)
      local playerCoords = GetEntityCoords(playerPed)
      local targetCoords = GetEntityCoords(targetPed)

      if target == player or #(playerCoords - targetCoords) < 20 then
          TriggerEvent('chat:addMessage', {args = {title, message}, color = color})
      end
   end
end)

RegisterNetEvent('sendProximityMessageMe')
AddEventHandler('sendProximityMessageMe', function(id, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)

    if pid == myId then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 2px; border: 2px solid rgba(110, 0, 194, 0.3); margin: 1px; size : 10px; background-color: rgba(255, 128, 242, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6[{0}] Me : ^0{1}</div>',
            args = { id, message }
        })
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.9 then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 2px; border: 2px solid rgba(110, 0, 194, 0.3); margin: 1px; size : 10px; background-color: rgba(255, 128, 242, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^6[{0}] Me : ^0{1}</div>',
            args = { id, message }
        })
    end
end)

RegisterNetEvent('sendProximityMessageDo')
AddEventHandler('sendProximityMessageDo', function(id, message)
    local myId = PlayerId()
    local pid = GetPlayerFromServerId(id)

    if pid == myId then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 2px; border: 2px solid rgba(255, 161, 0, 0.7); margin: 1px; background-color: rgba(255, 187, 51, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^3[{0}] Do : ^0{1}</div>',
            args = { id, message }
        })
    elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(myId)), GetEntityCoords(GetPlayerPed(pid)), true) < 19.9 then
        TriggerEvent('chat:addMessage', {
            template = '<div style="padding: 2px; border: 2px solid rgba(255, 161, 0, 0.7); margin: 1px; background-color: rgba(255, 187, 51, 0.2); border-radius: 3px;"><i class="fas fa-user"></i> ^3[{0}] Do : ^0{1}</div>',
            args = { id, message }
        })
    end
end)

Citizen.CreateThread(function()
    TriggerEvent('chat:addSuggestion', '/twt',  _U('twt_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    --TriggerEvent('chat:addSuggestion', '/atwt',  _U('anon_help'),  { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/me',   _U('me_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/entorno',   _U('entorno_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/do',   _U('do_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
    TriggerEvent('chat:addSuggestion', '/ooc',   _U('ooc_help'),   { { name = _U('generic_argument_name'), help = _U('generic_argument_help') } } )
end)

AddEventHandler('onResourceStop', function(resource)
    if resource == GetCurrentResourceName() then
        TriggerEvent('chat:removeSuggestion', '/twt')
        TriggerEvent('chat:removeSuggestion', '/me')
        TriggerEvent('chat:removeSuggestion', '/entorno')
        TriggerEvent('chat:removeSuggestion', '/do')
        TriggerEvent('chat:removeSuggestion', '/anon')
        TriggerEvent('chat:removeSuggestion', '/ooc')
    end
end)

local font = 0 -- Font of the text
local time = 350 -- Duration of the display of the text : 500 ~= 13sec
local msgQueue = {}

RegisterNetEvent('esx_rpchat:drawOnHead')
AddEventHandler('esx_rpchat:drawOnHead', function(text, color, source)
    Display(GetPlayerFromServerId(source), text, color)
end)

function Display(mePlayer, text, color)
    local timer = 0
    if msgQueue[mePlayer] == nil then
        msgQueue[mePlayer] = {}
    end
    table.insert(msgQueue[mePlayer], { txt = text , c= color, tim = 0 })
    while tablelength(msgQueue[mePlayer]) > 0 do
        Wait(0)
        timer = timer + 1
        local coords = GetEntityCoords(GetPlayerPed(mePlayer), false)
        local lineNumber = 1
        for k, v in pairs(msgQueue[mePlayer]) do
            DrawText3D(coords['x'], coords['y'], coords['z']+lineNumber, v.txt, v.c)
            lineNumber = lineNumber + 0.12
            if(v.tim > time)then
                msgQueue[mePlayer][k] = nil
            else
                v.tim= v.tim + 1
            end
        end
    end
end

function tablelength(T)
    local count = 0
    for _ in pairs(T) do count = count + 1 end
    return count
  end
function DrawText3D(x,y,z, text, color)
    local onScreen,_x,_y = World3dToScreen2d(x,y,z)
    local px,py,pz = table.unpack(GetGameplayCamCoord())
    local dist = GetDistanceBetweenCoords(px,py,pz, x,y,z, 1)
 
    local scale = (1/dist)*2
    local fov = (1/GetGameplayCamFov())*100
    local scale = scale*fov

    if onScreen then
        SetTextScale(0.0*scale, 0.55*scale)
        SetTextFont(font)
        SetTextProportional(1)
        SetTextColour(color.r, color.g, color.b, color.alpha)
        SetTextDropshadow(0, 0, 0, 0, 255)
        SetTextEdge(2, 0, 0, 0, 150)
        SetTextDropShadow()
        SetTextOutline()
        SetTextEntry("STRING")
        SetTextCentre(true)
        AddTextComponentString(text)
        EndTextCommandDisplayText(_x, _y)
    end
end