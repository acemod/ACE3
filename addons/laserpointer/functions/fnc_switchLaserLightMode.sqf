// by commy2
#include "script_component.hpp"

private ["_unit", "_weapon"];

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

// disable inheritance for this entry, because addons claim this as a base class for convenience
if !((_config >> "ACE_nextModeClass") in configProperties [_config, "true", false]) exitWith {};

private ["_description", "_picture"];

_description = getText (configFile >> "CfgWeapons" >> _nextPointer >> "ACE_modeDescription");
_picture = getText (configFile >> "CfgWeapons" >> _nextPointer >> "picture");

switch (_currentWeaponType) do {
	case 1: {
		_unit removePrimaryWeaponItem _pointer;
		_unit addPrimaryWeaponItem _nextPointer;
	};
	case 2: {
		_unit removeSecondaryWeaponItem _pointer;
		_unit addSecondaryWeaponItem _nextPointer;
	};
	case 3: {
		_unit removeHandgunItem _pointer;
		_unit addHandgunItem _nextPointer;
	};
};

[_description, _picture] call EFUNC(common,displayTextPicture);
playSound "ACE_Sound_Click";
