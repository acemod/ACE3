#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Text statement for the magazine's AI Usage.
 *
 * Arguments:
 * 0: not used
 * 1: item config path (CONFIG)
 *
 * Return Value:
 * String to display
 *
 * Public: No
 */

params ["", "_config"];
TRACE_1("statTextStatement_magazineAiUsage",_config);

private _ammo = getText (_config >> "ammo");
private _aiAmmoUsageFlags = getNumber (configFile >> "CfgAmmo" >> _ammo >> "aiAmmoUsageFlags");
private _cost = getNumber (configFile >> "CfgAmmo" >> _ammo >> "cost");

private _output = [];

if ([_aiAmmoUsageFlags, 1] call BIS_fnc_bitflagsCheck) then { _output pushBack LLSTRING(ammoUsageShort_illumination) };
if ([_aiAmmoUsageFlags, 4] call BIS_fnc_bitflagsCheck) then { _output pushBack LLSTRING(ammoUsageShort_concealment) };
if ([_aiAmmoUsageFlags, 64] call BIS_fnc_bitflagsCheck) then { _output pushBack LLSTRING(ammoUsageShort_infantry) };
if ([_aiAmmoUsageFlags, 128] call BIS_fnc_bitflagsCheck) then { _output pushBack LLSTRING(ammoUsageShort_lightVehicle) };
if ([_aiAmmoUsageFlags, 256] call BIS_fnc_bitflagsCheck) then { _output pushBack LLSTRING(ammoUsageShort_armor) };
if ([_aiAmmoUsageFlags, 512] call BIS_fnc_bitflagsCheck) then { _output pushBack LLSTRING(ammoUsageShort_aircraft) };

(_output joinString ", ") + format [" [%1 %2]", localize "str_a3_cfgvehicles_modulecuratorsetobjectcost_f_arguments_cost", _cost]
