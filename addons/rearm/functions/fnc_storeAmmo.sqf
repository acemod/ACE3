/*
 * Author: GitHawk
 * Stores ammo in an ammo truck.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, dummy] call ace_rearm_fnc_storeAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

private "_dummy";
params ["_target", "_unit"];

_dummy = _unit getVariable [QGVAR(dummy), objNull];
if (isNull _dummy) exitwith {};


[
    5,
    _unit,
    {params ["_unit"]; [_unit, true, true] call FUNC(dropAmmo)},
    "",
    format [localize LSTRING(StoreAmmoAction), getText(configFile >> "CfgMagazines" >> (_dummy getVariable QGVAR(magazineClass)) >> "displayName"), getText(configFile >> "CfgVehicles" >> (typeOf _target) >> "displayName")],
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
