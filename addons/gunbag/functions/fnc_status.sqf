#include "script_component.hpp"
/*
 * Author: Ir0n1E
 * Check gunbag status full/empty.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_gunbag_fnc_status
 *
 * Public: No
 */

params ["_unit"];

private _state = (backpackContainer _unit) getVariable [QGVAR(gunbagWeapon), []];

if (_state isEqualTo []) then {
    [localize LSTRING(empty)] call EFUNC(common,displayTextStructured);
} else {
    _state params ["_weapon"];

    [
        getText (configFile >> "CfgWeapons" >> _weapon >> "displayname"),
        getText (configFile >> "CfgWeapons" >> _weapon >> "picture")
    ] call EFUNC(common,displayTextPicture);
};
