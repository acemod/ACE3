/*
 * Author: GitHawk
 * Get the supply count.
 *
 * Argument:
 * 0: Target <OBJECT>
 *
 * Return value:
 * Supply count <NUMBER>
 *
 * Example:
 * [ammo_truck] call ace_rearm_fnc_getSupplyCount
 *
 * Public: Yes
 */
#include "script_component.hpp"

params [["_target", objNull, [objNull]]];

private _supply = _target getVariable QGVAR(currentSupply);

if (isNil "_supply") then {
    _supply = getNumber (configFile >> "CfgVehicles" >> typeOf _target >> QGVAR(defaultSupply));
    _target setVariable [QGVAR(currentSupply), _supply, true];
};

_supply
