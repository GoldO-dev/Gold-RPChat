
--##########    VRP Main    ##########--
-- init vRP client context
Tunnel = module("vrp", "lib/Tunnel")
Proxy = module("vrp", "lib/Proxy")

local cvRP = module("vrp", "client/vRP")
vRP = cvRP()

local pvRP = {}
-- load script in vRP context
pvRP.loadScript = module
Proxy.addInterface("vRP", pvRP)

local cfg = module("gold_rpchat", "cfg/cfg")            	-- Optiona, Change vrp_template to match folder name

local luang = module("vrp", "lib/luang")

local gold_rpchat = class("gold_rpchat", vRP.Extension)           -- Class Name, Can be changed to anything (match with server class name to make things easier

function gold_rpchat:__construct()                            	-- Change Template to match Class Name
	vRP.Extension.__construct(self)
end

--##########    VRP Main done    ##########--

local oocEnabled = true

RegisterNetEvent("UseMeCommand")
AddEventHandler("UseMeCommand", function(id, name, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if sID == cID then
        if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 156, 118, 152},
                multiline = true,
                args = {"^** "..name.." "..message}
            })
        end
    elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
        TriggerEvent('chat:addMessage', {
            color = { 156, 118, 152},
            multiline = true,
            args = {"^** "..name.." "..message}
        })
    end
end)

RegisterNetEvent("UseDoCommand")
AddEventHandler("UseDoCommand", function(id, name, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if sID == cID then
        if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 156, 118, 152},
                multiline = true,
                args = {"^** "..name.." (( "..message.." ))"}
            })
        end
    elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
        TriggerEvent('chat:addMessage', {
            color = { 156, 118, 152},
            multiline = true,
            args = {"^** "..name.." (( "..message.." ))"}
        })
    end
end)

RegisterNetEvent("UseSayCommand")
AddEventHandler("UseSayCommand", function(id, name, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if sID == cID then
        if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^7 ^* "..name.." says: "..message}
            })
        end
    elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"^7 ^* "..name.." says: "..message}
        })
    end
end)

RegisterNetEvent("UseShoutCommand")
AddEventHandler("UseShoutCommand", function(id, name, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if sID == cID then
        if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^7 ^* "..name.." shouts: "..message}
            })
        end
    elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"^7 ^* "..name.." shouts: "..message}
        })
    end
end)

RegisterNetEvent("UseWhisperCommand")
AddEventHandler("UseWhisperCommand", function(id, name, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if sID == cID then
        if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 217, 225, 105},
                multiline = true,
                args = {"^* "..name.." whispers: "..message}

            })
        end
    elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
        TriggerEvent('chat:addMessage', {
            color = { 217, 225, 105},
            multiline = true,
            args = {"^* "..name.." whispers: "..message}
        })
    end
end)

RegisterNetEvent("CarWhisperNotInCarClient")
AddEventHandler("CarWhisperNotInCarClient", function()
    TriggerEvent('chat:addMessage', {
        color = { 217, 225, 105},
        multiline = true,
        args = {"^* You need to be in a car to use this command."}
    })
end)

RegisterNetEvent("UseCarWhisperCommand")
AddEventHandler("UseCarWhisperCommand", function(id, name, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    local ped = GetPlayerPed(-1)
    if IsPedInAnyVehicle(pedID, true) then
        if sID == cID then
            if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
                TriggerEvent('chat:addMessage', {
                    color = { 217, 225, 105},
                    multiline = true,
                    args = {"^* (Car) "..name.." whispers: "..message}
                })
            end
        elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 217, 225, 105},
                multiline = true,
                args = {"^* (Car) "..name.." whispers: "..message}
            })
        end
    else
        TriggerServerEvent("CarWhisperNotInCarServer", id)
    end
end)

RegisterNetEvent("UseOocCommand")
AddEventHandler("UseOocCommand", function(id, vId, name, steamName, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if oocEnabled == true then
        if sID == cID then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^7 ^*(( ["..tostring(vId).."] [OOC] "..name.." ("..steamName.."): "..message.." ))"}
            })
        elseif GetDistanceBetweenCoords(GetEntityCoords(GetPlayerPed(cID)), GetEntityCoords(GetPlayerPed(sID)), true) < 19.999 then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^7 ^*(( ["..tostring(vId).."] [OOC] "..name.." ("..steamName.."): "..message.." ))"}
            })
        end
    elseif oocEnabled == false then
        return
    end
end)

RegisterNetEvent("UseLocalOocCommand")
AddEventHandler("UseLocalOocCommand", function(id, vId, name, steamName, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    if oocEnabled == true then
        if sID == cID then
            if GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
                TriggerEvent('chat:addMessage', {
                    color = { 255, 0, 0},
                    multiline = true,
                    args = {"^7 ^*(( ["..tostring(vId).."] [LOCAL OOC] "..name.." ("..steamName.."): "..message.." ))"}
                })
            end
        elseif GetDistanceBetweenCoords(GetEntityCoords(pedID), GetEntityCoords(GetPlayerPed(sID)), true) < cfg.proximityRange then
            TriggerEvent('chat:addMessage', {
                color = { 255, 0, 0},
                multiline = true,
                args = {"^7 ^*(( ["..tostring(vId).."] [LOCAL OOC] "..name.." ("..steamName.."): "..message.." ))"}
            })
        end
    elseif oocEnabled == false then
        return
    end
end)

RegisterNetEvent("UseAoocCommandNotStaff")
AddEventHandler("UseAoocCommandNotStaff", function()
    TriggerEvent('chat:addMessage', {
        color = { 194, 58, 71},
        multiline = true,
        args = {"^*[!]: ^r ^7 ^* You are not allowed to use this command, because it is a staff only command"}
    })
end)

RegisterNetEvent("UseAoocCommand")
AddEventHandler("UseAoocCommand", function(id, vId, name, steamName, message)
    local cID = PlayerId()
    local sID = GetPlayerFromServerId(id)
    local pedID = PlayerPedId()
    TriggerEvent('chat:addMessage', {
        color = { 218, 73, 15},
        multiline = true,
        args = {"^*(( ["..tostring(vId).."] [AOOC] "..name.." ("..steamName.."): "..message.." ))"}
    })
end)

RegisterNetEvent("ToggleOocCommand")
AddEventHandler("ToggleOocCommand", function()
    if oocEnabled == true then
        TriggerEvent('chat:addMessage', {
            color = { 194, 58, 71},
            multiline = true,
            args = {"^*[!]: ^r ^7 ^* Out Of Character has been disabled. You may bote that staff can continue to use AOOC."}
        })
        oocEnabled = false
    elseif oocEnabled == false then
        TriggerEvent('chat:addMessage', {
            color = { 194, 58, 71},
            multiline = true,
            args = {"^*[!]: ^r ^7 ^* Out Of Character has been enabled."}
        })
        oocEnabled = true
    end
end)

RegisterNetEvent("UseAnnounceCommand")
AddEventHandler("UseAnnounceCommand", function(isConsole, message)
    if isConsole == true then
        TriggerEvent('chat:addMessage', {
            color = { 194,58,71},
            multiline = true,
            args = {"^* SYSTEM: "..message}
        })
    elseif isConsole == false then
        TriggerEvent('chat:addMessage', {
            color = { 255, 0, 0},
            multiline = true,
            args = {"^7 ^* You must be in the server console in order to use this command."}
        })
    end
end)


vRP:registerExtension(gold_rpchat)   