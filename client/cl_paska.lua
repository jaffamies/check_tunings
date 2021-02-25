ESX = nil

local Vehicles = {}

Citizen.CreateThread(function()
	while ESX == nil do
		TriggerEvent('esx:getSharedObject', function(obj) ESX = obj end)
		Citizen.Wait(0)
	end
end)

Citizen.CreateThread(function()
	local blip = AddBlipForCoord(vector3(-199.19, -1381.24, 31.26))

	SetBlipSprite(blip, 596)
	SetBlipScale(blip, 1.0)
	SetBlipColour(blip, 4)
	SetBlipDisplay(blip, 4)
	SetBlipAsShortRange(blip, true)

	BeginTextCommandSetBlipName("STRING")
	AddTextComponentString("Check Car Tunings")
	EndTextCommandSetBlipName(blip)


end)

Citizen.CreateThread(function(data)
while true do
Wait(0)
local ped = GetPlayerPed(-1)
local pos = GetEntityCoords(ped)
local dist = GetDistanceBetweenCoords(pos.x, pos.y, pos.z, -199.19, -1381.24, 31.26, true)


		if dist < 7.8 and IsPedInAnyVehicle(ped, false) then
	DrawMarker(36, -199.19, -1381.24, 31.26, 0.0, 0.0, 0.0, 0.0, 0.0, 0.0, 2.0, 2.0, 2.0, 255, 128, 0, 255, true, true, 2, nil, nil, true)
	
	if dist < 2.8 then
	
	ESX.ShowHelpNotification('Press ~INPUT_CONTEXT~ to check car tunings')
	
	if IsControlJustPressed(0, 38) then
	
	
	local vehicle = GetVehiclePedIsIn(ped)
	local vehProps = ESX.Game.GetVehicleProperties(vehicle)
	local model       = GetEntityModel(vehicle)
	local modelName 	= GetDisplayNameFromVehicleModel(model)
	local modCount = GetNumVehicleMods(vehicle, modType)
	
	vehProps.modEngine = vehProps.modEngine + 1
	vehProps.modBrakes = vehProps.modBrakes + 1
	vehProps.modArmor = vehProps.modArmor + 1
	vehProps.modSuspension = vehProps.modSuspension + 1
	vehProps.modTransmission = vehProps.modTransmission + 1
	
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Car model: ' ..modelName })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Brakes level: ' .. tostring(vehProps.modBrakes).. '/' .. GetNumVehicleMods(vehicle, 12) })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Engine level: ' .. tostring(vehProps.modEngine).. '/' .. GetNumVehicleMods(vehicle,11) })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Armor level: ' .. tostring(vehProps.modArmor).. '/' .. GetNumVehicleMods(vehicle, 16) })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Suspension level: ' .. tostring(vehProps.modSuspension).. '/' .. GetNumVehicleMods(vehicle,15)})
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Transmission level: ' .. tostring(vehProps.modTransmission).. '/' .. GetNumVehicleMods(vehicle,13)})
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Turbo: ' .. tostring(vehProps.modTurbo)})

				end
			end
		end
	end
end)

RegisterNetEvent('katsotuunaukset')
AddEventHandler('katsotuunaukset', function()
local ped = GetPlayerPed(-1)

	local vehicle = GetVehiclePedIsIn(ped)
	local vehProps = ESX.Game.GetVehicleProperties(vehicle)
	local model       = GetEntityModel(vehicle)
	local modelName 	= GetDisplayNameFromVehicleModel(model)
	local modCount = GetNumVehicleMods(vehicle, modType)

	vehProps.modEngine = vehProps.modEngine + 1
	vehProps.modBrakes = vehProps.modBrakes + 1
	vehProps.modArmor = vehProps.modArmor + 1
	vehProps.modSuspension = vehProps.modSuspension + 1
	vehProps.modTransmission = vehProps.modTransmission + 1
	
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Car model: ' ..modelName })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Brakes level: ' .. tostring(vehProps.modBrakes).. '/' .. GetNumVehicleMods(vehicle, 12) })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Engine level: ' .. tostring(vehProps.modEngine).. '/' .. GetNumVehicleMods(vehicle,11) })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Armor level: ' .. tostring(vehProps.modArmor).. '/' .. GetNumVehicleMods(vehicle, 16) })
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Suspension level: ' .. tostring(vehProps.modSuspension).. '/' .. GetNumVehicleMods(vehicle,15)})
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Transmission level: ' .. tostring(vehProps.modTransmission).. '/' .. GetNumVehicleMods(vehicle,13)})
	TriggerEvent('mythic_notify:client:SendAlert', { type = 'inform', length = 30000, text = 'Turbo: ' .. tostring(vehProps.modTurbo)})
		
end)
