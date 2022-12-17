local gold_rpchat = class("gold_rpchat", vRP.Extension)                    				-- Class Name, Can be changed to anything
local lang = vRP.lang

function gold_rpchat:__construct()                                    					-- Change Template to match Class Name
	vRP.Extension.__construct(self)
	
	
	self.cfg = module("gold_rpchat", "cfg/cfg")									-- links cfg file
end

gold_rpchat.event = {}
gold_rpchat.tunnel = {}

RegisterCommand("me", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseMeCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterCommand("do", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseDoCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterCommand("say", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseSayCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterCommand("shout", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseShoutCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterCommand("w", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseWhisperCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterCommand("whisper", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseWhisperCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterCommand("cw", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local id = vRP:authUser(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseCarWhisperCommand", -1, source, fullName, table.concat(args, " "))
end, false)

RegisterNetEvent("CarWhisperNotInCarServer")
AddEventHandler("CarWhisperNotInCarServer", function(id)
	TriggerClientEvent("CarWhisperNotInCarClient", id)
end)

RegisterCommand("ooc", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local id = vRP:authUser(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseOocCommand", -1, source, id, fullName, name, table.concat(args, " "))
end, false)

RegisterCommand("looc", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local id = vRP:authUser(source)
	local user = vRP.users_by_source[source]
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	TriggerClientEvent("UseLocalOocCommand", -1, source, id, fullName, name, table.concat(args, " "))
end, false)

RegisterCommand("aooc", function(source, args, rawCommand)
	local name = GetPlayerName(source)
	local id = vRP:authUser(source)
	local user = vRP.users_by_source[source]
	local permissions
	local firstName = user.identity.firstname
	local lastName = user.identity.name
	local fullName = firstName.." "..lastName
	if user:hasPermission("staff.chat") then
		--User is staff
		TriggerClientEvent("UseAoocCommand", -1, source, id, fullName, name, table.concat(args, " "))
	else
		--User is not staff
		TriggerClientEvent("UseAoocCommandNotStaff", source)
	end
end, false)

RegisterCommand("togooc", function(source, args, rawCommand)
	print("Triggering toggle ooc event")
	TriggerClientEvent("ToggleOocCommand", source)
	print("Toggle OOC event triggered")
end, false)


RegisterCommand("announce", function(source, args, rawCommand)
    -- If the source is > 0, then that means it must be a player.
    if (source > 0) then
	TriggerClientEvent("UseAnnounceCommand", source, false)
    -- If it's not a player, then it must be RCON, a resource, or the server console directly.
    else
		TriggerClientEvent("UseAnnounceCommand", -1, true, table.concat(args, " "))
    end
end, false)

vRP:registerExtension(gold_rpchat)                                    					-- Change Template to match Class Name