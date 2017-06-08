/*
 * Author: GitHawk
 * Get the supply count.
 *
 * Arguments:
 * 0: Ammo Truck <OBJECT>
 *
 * Return Value:
 * Supply count <NUMBER>
 *
 * Example:
 * [ammo_truck] call ace_rearm_fnc_getSupplyCount
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [
    ["_truck", objNull, [objNull]]
];

private _supply = _truck getVariable QGVAR(currentSupply);

if (isNil "_supply") then {
    _supply = getNumber (configFile >> "CfgVehicles" >> typeOf _truck >> QGVAR(defaultSupply));
    _truck setVariable [QGVAR(currentSupply), _supply, true];
};

_supply
