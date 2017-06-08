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

params [["_truck", objNull, [objNull]]];

if (GVAR(supply) != 1) exitWith {
    WARNING("supply setting is not set to limited"); // func shouldn't have been called
    -1
};

private _supply = _truck getVariable QGVAR(currentSupply);

if (isNil "_supply") then {
    if (isNumber (configFile >> "CfgVehicles" >> typeOf _truck >> QGVAR(defaultSupply))) then {
        _supply = getNumber (configFile >> "CfgVehicles" >> typeOf _truck >> QGVAR(defaultSupply));
    } else {
        _supply = 1200;
    };
    if (_supply > 0) then {
        _truck setVariable [QGVAR(currentSupply), _supply, true];
    };
};

_supply
