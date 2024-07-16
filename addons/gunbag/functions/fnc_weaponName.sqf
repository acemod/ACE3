#include "..\script_component.hpp"
/*
 * Author: Ir0n1E, Brett Mayson
 * Get gunbag weapon name
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_gunbag_fnc_weaponName
 *
 * Public: No
 */

params ["_unit"];

private _state = (backpackContainer _unit) getVariable [QGVAR(gunbagWeapon), []];

private _name = localize LSTRING(empty);
if (_state isNotEqualTo []) then {
    _name = getText (configFile >> "CfgWeapons" >> _state#0 >> "displayName");
};
_name
