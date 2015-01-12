/**
 * fn_generateMalfunctions_wh.sqf
 * @Descr: Generates weapon malfunctions based on barrel temperature and weapon cleanness
 * @Author: Ruthberg
 *
 * @Arguments: [unit OBJECT, weapon STRING, muzzle STRING, barrelTemperature NUMBER]
 * @Return: nil
 * @PublicAPI: false
 */


#define MALFUNCTION_BASE_RATE 0.0001 // Base rate 1 : 10000

private ["_unit", "_weapon", "_muzzle", "_malfunctionRate"];
_unit              = _this select 0;
_weapon            = _this select 1;
_muzzle            = _this select 2;
_barrelTemperature = _this select 3;

if (_unit getVariable[format["CSE_Malfunction_%1_%2", _weapon, _muzzle], false]) exitWith {
	switch (getNumber (configFile >> "CfgWeapons" >> _weapon >> "type")) do {
		case 1: {
			playSound3d["\cse\cse_sys_weaponheat\sound\jamming_rifle.wav", _unit,  false, getPos _unit, 1.5, 1, 10];
		};
		case 2: {
			playSound3d["\cse\cse_sys_weaponheat\sound\jamming_pistol.wav", _unit,  false, getPos _unit, 1.5, 1, 10];
		};
		default {

		};
	};

};

_malfunctionRate = MALFUNCTION_BASE_RATE max (_barrelTemperature / 1500)^4;

// TODO: Add consideration of weapon cleanness

if (_malfunctionRate > random 1) then {
	[_unit, _weapon, _muzzle] call cse_fnc_jamWeapon_wh;

	switch (getNumber (configFile >> "CfgWeapons" >> _weapon >> "type")) do {
		case 1: {
			playSound3d["\cse\cse_sys_weaponheat\sound\jamming_rifle.wav", _unit,  false, getPos _unit, 15, 1, 10];
		};
		case 2: {
			playSound3d["\cse\cse_sys_weaponheat\sound\jamming_pistol.wav", _unit,  false, getPos _unit, 15, 1, 10];
		};
		default {

		};
	};
};
