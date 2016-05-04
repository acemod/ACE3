/*
 * Author: Ir0n1E
 * Check if client able to interact with gunbag
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * <NUMBER> -1: can't interact 0: empty gunbag 1: full gunbag
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit","_target"];

private ["_result","_gunbag"];

_result = -1;
_gunbag = backpackContainer _target;

if(count (_gunbag getVariable [QGVAR(GunbagWeapon),[]]) <= 0 && {primaryWeapon _unit != ""} && {getNumber (configFile >> "CfgWeapons" >> primaryWeapon _unit  >> QGVAR(allowGunbag)) == 1}) then {
  _result = 0;
};

if(count (_gunbag getVariable [QGVAR(GunbagWeapon),[]]) >= 1 && {primaryWeapon _unit == ""}) then {
  _result = 1;
};

_result
