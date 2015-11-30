/*
 * Author: Commy2
 * Switch between laser modes.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon"];

private _pointer = (_unit weaponAccessories _weapon) select 1;

if (_pointer == "") exitWith {};

private _config = configFile >> "CfgWeapons" >> _pointer;

private _nextPointer = getText (_config >> "ACE_nextModeClass");

if (_nextPointer == "") exitWith {};

//If system disabled, don't switch to a laser:
private _nextPointerIsLaser = getNumber (configFile >> "CfgWeapons" >> _nextPointer >> "ACE_laserpointer");
if ((!GVAR(enabled)) && {_nextPointerIsLaser == 1}) exitWith {};

// disable inheritance for this entry, because addons claim this as a base class for convenience
if !((_config >> "ACE_nextModeClass") in configProperties [_config, "true", false]) exitWith {};

_unit addWeaponItem [_weapon, _nextPointer];

private _error = false;

if ((_unit weaponAccessories _weapon) select 1 != _nextPointer) then {
    ERROR("NextPointer not compatible");
    _unit addWeaponItem [_weapon, _pointer];
    _error = true;
};

if (!_error) then {
    private _description = getText (configFile >> "CfgWeapons" >> _nextPointer >> "ACE_modeDescription");
    private _picture = getText (configFile >> "CfgWeapons" >> _nextPointer >> "picture");

    [_description, _picture] call EFUNC(common,displayTextPicture);
} else {
    ACE_LOGERROR_3("Failed to add %1 to %2 - reverting to %3",_nextPointer,_weapon,_pointer);
};

playSound "ACE_Sound_Click";
