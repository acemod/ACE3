// by commy2
#include "script_component.hpp"

private ["_unit", "_weapon", "_error"];

_unit = _this select 0;
_weapon = _this select 1;

// 1 = primary, 2 = secondary, 3 = handgun
private "_currentWeaponType";
_currentWeaponType = 0;

private "_pointer";
_pointer = switch (_weapon) do {
	case (primaryWeapon _unit): {
		_currentWeaponType = 1;
		primaryWeaponItems _unit select 1
	};
	case (secondaryWeapon _unit): {
		_currentWeaponType = 2;
		secondaryWeaponItems _unit select 1
	};
	case (handgunWeapon _unit): {
		_currentWeaponType = 3;
		handgunItems _unit select 1
	};
	default {""};
};

if (_pointer == "") exitWith {};

private "_config";
_config = configFile >> "CfgWeapons" >> _pointer;

private "_nextPointer";
_nextPointer = getText (_config >> "ACE_nextModeClass");

if (_nextPointer == "") exitWith {};

//If system disabled, don't switch to a laser:
private "_nextPointerIsLaser";
_nextPointerIsLaser = getNumber (configFile >> "CfgWeapons" >> _nextPointer >> "ACE_laserpointer");
if ((!GVAR(enabled)) && {_nextPointerIsLaser == 1}) exitWith {};

// disable inheritance for this entry, because addons claim this as a base class for convenience
if !((_config >> "ACE_nextModeClass") in configProperties [_config, "true", false]) exitWith {};

private ["_description", "_picture"];

_description = getText (configFile >> "CfgWeapons" >> _nextPointer >> "ACE_modeDescription");
_picture = getText (configFile >> "CfgWeapons" >> _nextPointer >> "picture");
_error = false;

switch (_currentWeaponType) do {
    case 1: {
        _unit removePrimaryWeaponItem _pointer;
        _unit addPrimaryWeaponItem _nextPointer;
        if (((primaryWeaponItems _unit) select 1) != _nextPointer) then {
            ERROR("NextPointer not compatible");
            _unit addPrimaryWeaponItem _pointer;
            _error = true;
        };
    };
    case 2: {
        _unit removeSecondaryWeaponItem _pointer;
        _unit addSecondaryWeaponItem _nextPointer;
        if (((secondaryWeaponItems _unit) select 1) != _nextPointer) then {
            ERROR("NextPointer not compatible");
            _unit addSecondaryWeaponItem _pointer;
            _error = true;
        };
    };
    case 3: {
        _unit removeHandgunItem _pointer;
        _unit addHandgunItem _nextPointer;
        if (((handgunItems _unit) select 1) != _nextPointer) then {
            ERROR("NextPointer not compatible");
            _unit addHandgunItem _pointer;
            _error = true;
        };
    };
};

if (!_error) then {
    [_description, _picture] call EFUNC(common,displayTextPicture);
} else {
	ACE_LOGERROR_3("Failed to add %1 to %2 - reverting to %3",_nextPointer,_weapon,_pointer);
};
playSound "ACE_Sound_Click";
