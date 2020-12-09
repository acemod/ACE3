#include "script_component.hpp"
/*
 * Author: Ir0n1E
 * Check if client is able to interact with gunbag.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * -1: can't interact 0: empty gunbag 1: full gunbag 2: full gunbag & has primary <NUMBER>
 *
 * Example:
 * _canInteract = [player, target] call ace_gunbag_fnc_canInteract
 *
 * Public: No
 */

params ["_unit", "_target"];

private _result = -1;
private _gunbag = backpackContainer _target;
private _weapon = primaryWeapon _unit;

if ((_gunbag getVariable [QGVAR(gunbagWeapon), []]) isEqualTo [] && {_weapon != ""} && {!(_weapon call FUNC(isMachineGun))}) then {
    _result = 0;
};

if (!((_gunbag getVariable [QGVAR(gunbagWeapon), []]) isEqualTo []) && {_weapon == ""}) then {
    _result = 1;
};
if (!((_gunbag getVariable [QGVAR(gunbagWeapon), []]) isEqualTo []) && {_weapon != ""}) then {
    _result = 2;
};
_result
