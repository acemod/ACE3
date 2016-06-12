/*
 * Author: Ir0n1E
 * Check if client able to interact with gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * <NUMBER> -1: can't interact 0: empty gunbag 1: full gunbag
 *
 * Example:
 * _canInteract = [player, target] call ace_gunbag_fnc_canInteract
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_target"];

private _result = -1;
private _gunbag = backpackContainer _target;

if ((_gunbag getVariable [QGVAR(gunbagWeapon), []]) isEqualTo [] && {primaryWeapon _unit != ""} && {getNumber (configFile >> "CfgWeapons" >> primaryWeapon _unit  >> QGVAR(allowGunbag)) == 1}) then {
    _result = 0;
};

if (!((_gunbag getVariable [QGVAR(gunbagWeapon), []]) isEqualTo []) && {primaryWeapon _unit == ""}) then {
    _result = 1;
};

_result
