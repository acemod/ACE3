#include "script_component.hpp"
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

if ([_aiAmmoUsageFlags, 1] call BIS_fnc_bitflagsCheck) then { _output pushBack "Illum" };
if ([_aiAmmoUsageFlags, 64] call BIS_fnc_bitflagsCheck) then { _output pushBack "Inf" };
if ([_aiAmmoUsageFlags, 128] call BIS_fnc_bitflagsCheck) then { _output pushBack "Veh" };
if ([_aiAmmoUsageFlags, 256] call BIS_fnc_bitflagsCheck) then { _output pushBack "Air" };
if ([_aiAmmoUsageFlags, 512] call BIS_fnc_bitflagsCheck) then { _output pushBack "Armor" };

(_output joinString ", ") + format [" [Cost %1]", _cost]
