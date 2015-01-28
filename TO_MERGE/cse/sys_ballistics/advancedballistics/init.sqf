private ["_args"];
_args = _this;
{
	_varName = "cse_ab_"+(_x select 0);
	missionNamespace setvariable[_varName, _x select 1];
}foreach _args;

cse_ab_AdvancedBallistics = true;

if (isNil "cse_AB_WindEnabled") then { cse_AB_WindEnabled = cse_AB_WIND_ENABLED };
if (isNil "cse_AB_SpinDriftEnabled") then { cse_AB_SpinDriftEnabled = cse_AB_SPIN_DRIFT_ENABLED };
if (isNil "cse_AB_CoriolisEnabled") then { cse_AB_CoriolisEnabled = cse_AB_CORIOLIS_ENABLED };
if (isNil "cse_AB_EoetvoesEnabled") then { cse_AB_EoetvoesEnabled = cse_AB_EOETVOES_ENABLED };
if (isNil "cse_AB_AdvancedAirDragEnabled") then { cse_AB_AdvancedAirDragEnabled = cse_AB_ADVANCED_AIR_DRAG_ENABLED };
if (isNil "cse_AB_TransonicRegionEnabled") then { cse_AB_TransonicRegionEnabled = cse_AB_TRANSONIC_REGION_ENABLED };
if (isNil "cse_AB_MilTurretsEnabled") then { cse_AB_MilTurretsEnabled = cse_AB_MIL_TURRETS_ENABLED };
if (isNil "cse_AB_AmmoTemperatureEnabled") then { cse_AB_AmmoTemperatureEnabled = cse_AB_AMMO_TEMPERATURE_ENABLED };
if (isNil "cse_AB_BulletTraceEnabled") then { cse_AB_BulletTraceEnabled = cse_AB_BULLET_TRACE_ENABLED };
if (isNil "cse_AB_MirageEnabled") then { cse_AB_MirageEnabled = cse_AB_MIRAGE_ENABLED };
if (isNil "cse_AB_AtmosphericDensitySimulationEnabled") then { cse_AB_AtmosphericDensitySimulationEnabled = cse_AB_ATMOSPHERIC_DENSITY_SIMULATION_ENABLED };
if (isNil "cse_AB_BarrelLengthInfluenceEnabled") then { cse_AB_BarrelLengthInfluenceEnabled = cse_AB_BARREL_LENGTH_INFLUENCE };
if (isNil "cse_AB_VehicleGunnerEnabled") then { cse_AB_VehicleGunnerEnabled = cse_AB_VEHICLE_GUNNER_ENABLED };
if (isNil "cse_AB_ExtensionsEnabled") then { cse_AB_ExtensionsEnabled = cse_AB_EXTENSIONS_ENABLED };
if (isNil "cse_AB_InitMessageEnabled") then { cse_AB_InitMessageEnabled = cse_AB_INIT_MESSAGE_ENABLED };
if (isNil "cse_AB_OnlyActiveForLocalPlayer") then { cse_AB_OnlyActiveForLocalPlayer = cse_AB_ONLY_ACTIVE_FOR_LOCAL_PLAYER };
if (isNil "cse_AB_OnlyActiveForPlayerGroup") then { cse_AB_OnlyActiveForPlayerGroup = cse_AB_ONLY_ACTIVE_FOR_PLAYER_GROUP };
if (isNil "cse_AB_Precision") then { cse_AB_Precision = cse_AB_PRECISION };
if (isNil "cse_AB_DisabledByDefault") then { cse_AB_DisabledByDefault = cse_AB_DISABLED_BY_DEFAULT in [true, 1] };

if (isNil "cse_AB_temperatureShift") then { cse_AB_temperatureShift = (random 3) - (random 3); publicVariable "cse_AB_temperatureShift"; };
if (isNil "cse_AB_badWeatherShift") then { cse_AB_badWeatherShift = (random 1)^2 * 10; publicVariable "cse_AB_badWeatherShift"; };
if (isNil "cse_AB_humidityShift") then { cse_AB_humidityShift = ((random 5) - (random 5)) / 100; publicVariable "cse_AB_humidityShift"; };

if (hasInterface) then {
	call compile preprocessFileLineNumbers "cse\cse_sys_ballistics\advancedballistics\initClient.sqf";
};
