/*
	Name: AGM_Goggles_fnc_DustHandler
	
	Author: Garth de Wet (LH)
	
	Description:
	Determines whether to place dust on the goggles, based on calibre of weapon fired and other requirements.
	
	Parameters: 
	0: Object - unit - eventhandler was attached to.			(Used)
	1: String - weapon - Weapon fired							(Used)
	
	Returns:
	Nothing
	
	Example:
	player addEventHandler ["Fired", {[_this select 0, _this select 1] call AGM_Goggles_fnc_DustHandler;}];
	See http://community.bistudio.com/wiki/ArmA_3:_Event_Handlers#Fired
*/
#include "\AGM_Goggles\script.sqf"

private ["_bullets", "_position", "_surface", "_found", "_weapon", "_cloudType"];
_weapon = _this select 1;
_cloudType = "";

if ((_this select 0) != player) exitWith {true};

if (isClass(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "FirstEffect")) then {
	_cloudType = getText(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "FirstEffect" >> "effectName");
} else {
	if (isClass(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "effect1")) then {
		_cloudType = getText(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "effect1" >> "effectName");
	};
};

if (_cloudType == "") exitWith {true};
if (rain > 0.1) exitWith {true};
if ((stance player) != "PRONE") exitWith {true};

_position = getPosATL player;

if (surfaceIsWater _position) exitWith {};
if ((_position select 2) > 0.2) exitWith {};

_surface = surfaceType _position;
_surface = ([_surface, "#"] call CBA_fnc_split) select 1;
_found = false;

_found = getNumber (ConfigFile >> "CfgSurfaces" >> _surface >> "dust") >= 0.1;

if (!_found) exitWith {};

_bullets = GETDUSTT(DBULLETS);

if ((time - GETDUSTT(DTIME)) > 1) then {
	_bullets = 0;
};

_bullets = _bullets + 1;
SETDUST(DBULLETS,_bullets);
SETDUST(DTIME,time);

if (GETDUSTT(DAMOUNT) < 2) then {
	private "_bulletsRequired";
	_bulletsRequired = 100;
	if (isNumber (ConfigFile >> _cloudType >> "AGM_Goggles_BulletCount")) then {
		_bulletsRequired = getNumber (ConfigFile >> _cloudType >> "AGM_Goggles_BulletCount");
	};

	if (_bulletsRequired <= _bullets) then {
		SETDUST(DACTIVE,true);
		call AGM_Goggles_fnc_ApplyDust;
	};
};
true
