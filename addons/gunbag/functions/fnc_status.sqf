/*
 * Author: Ir0n1E
 * check gunbag status full/empty
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
#include "script_component.hpp"

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
