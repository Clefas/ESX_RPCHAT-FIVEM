ESX = nil

TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)

AddEventHandler('es:invalidCommandHandler', function(source, command_args, user)
	CancelEvent()
	TriggerClientEvent('chat:addMessage', source, { args = { '^1SYSTEM', _U('unknown_command', command_args[1]) } })
end)

RegisterCommand('ooc', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end
	--DrawOnHead(source, args,{ r = 255, g = 50, b = 0, alpha = 200 })

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, ('['..source..'] OOC'), args, { 77, 77, 77 })
	
end, false)


RegisterCommand('tujita', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "maria" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('tuji_prefix', name), args }, color = { 39, 255, 0 } })

	end
end, false)

RegisterCommand('msg', function(source, args, user)

	if GetPlayerName(tonumber(args[1])) then
		local player = tonumber(args[1])
		table.remove(args, 1)
		
		TriggerClientEvent('chat:addMessage', player, {args = {"^5[MSG] "..GetPlayerName(source).. " [" .. source .. "] : ^7" ..table.concat(args, " ")}, color = {255, 255, 255}})
		TriggerClientEvent('chat:addMessage', source, {args = {"^1[MSG] a  ^4"..GetPlayerName(player).. "^6 [" .. player .. "] ^3[mensaje]: ^0" ..table.concat(args, " ")}, color = {255, 153, 0}})

	else
		TriggerClientEvent('chatMessage', source, "SISTEMA", {255, 0, 0}, "ID de jugador incorrecta!")
	end

end,false)


RegisterCommand('taxi', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "taxi" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('taxi_prefix', name), args }, color = { 255, 227, 51 } })

	end
end, false)

RegisterCommand('ayuda', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)

	TriggerClientEvent('chat:addMessage', -1, { args = { _U('ayuda_prefix', '['..source..'] '), args }, color = { 255, 0, 0 } })
	--print(('%s: %s'):format(name, args))
end, false)

RegisterCommand('bennys', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "groove" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('bennys_prefix', name), args }, color = { 255, 0, 0 } })

	end
end, false)

RegisterCommand('samir', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('samir_prefix', name), args }, color = { 255, 255, 255 } })

	end
end, false)

RegisterCommand('shisha', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "mechanic2" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('shisha_prefix', name), args }, color = { 255, 100, 0 } })

	end
end, false)


RegisterCommand('lspd', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "police" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('pol_prefix', name), args }, color = { 94, 161, 224 } })

	end
end, false)

RegisterCommand('cas', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "casino" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('cas_prefix', name), args }, color = { 102, 0, 102 } })

	end
end, false)

RegisterCommand('adems2', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end
	local target = ESX.GetPlayerFromId(source)

	if target.job ~= nil and target.job.name == "ambulance" then
		args = table.concat(args, ' ')
		local name = GetPlayerName(source)
		if Config.EnableESXIdentity then name = GetCharacterName(source) end

		TriggerClientEvent('chat:addMessage', -1, { args = { _U('ems_prefix', name), args }, color = { 255, 51, 51 } })

	end
end, false)

RegisterCommand('me', function(source, args, user)
	local name = GetPlayerName(source)
	TriggerClientEvent("sendProximityMessageMe", -1, source, table.concat(args, " "))
end)

RegisterCommand('do', function(source, args, user)
	local name = GetPlayerName(source)
	TriggerClientEvent("sendProximityMessageDo", -1, source, table.concat(args, " "))
end)

RegisterCommand('oop', function(source, args, rawCommand)
	if source == 0 then
		print('esx_rpchat: you can\'t use this command from rcon!')
		return
	end

	args = table.concat(args, ' ')
	local name = GetPlayerName(source)
	if Config.EnableESXIdentity then name = GetCharacterName(source) end

	TriggerClientEvent('esx_rpchat:sendProximityMessage', -1, source, ('['..source..'] OOP'), args, { 85, 85, 85 })

	--print(('%s: %s'):format(name, args))
end, false)

function GetCharacterName(source)
	local result = MySQL.Sync.fetchAll('SELECT firstname, lastname FROM users WHERE identifier = @identifier', {
		['@identifier'] = GetPlayerIdentifiers(source)[1]
	})

	if result[1] and result[1].firstname and result[1].lastname then
		if Config.OnlyFirstname then
			return result[1].firstname
		else
			return ('%s %s'):format(result[1].firstname, result[1].lastname)
		end
	else
		return GetPlayerName(source)
	end
end
local logEnabled = true

function DrawOnHead(playerid, text, color)
	TriggerClientEvent('esx_rpchat:drawOnHead', -1, text, color, playerid)
end


