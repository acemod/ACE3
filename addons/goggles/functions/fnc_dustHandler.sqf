/*
 * Author: Garth 'L-H' de Wet
 * Determines whether to place dust on the goggles, based on calibre of weapon fired and other requirements.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ace_player addEventHandler ["Fired", {[_this select 0, _this select 1] call ace_goggles_fnc_dustHandler;}];
 *
 * Public: No
 */
#include "script_component.hpp"
private ["_bullets", "_position", "_surface", "_weapon", "_cloudType", "_unit"];
params ["_unit", "_weapon"];
if (_unit != ACE_Player) exitWith {true};
_cloudType = "";

if (rain > 0.1) exitWith {true};
if ((stance _unit) != "PRONE") exitWith {true};

if (isClass(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "FirstEffect")) then {
    _cloudType = getText(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "FirstEffect" >> "effectName");
} else {
    if (isClass(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "effect1")) then {
        _cloudType = getText(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "effect1" >> "effectName");
    };
};

if (_cloudType == "") exitWith {true};

_position = getPosATL _unit;

if (surfaceIsWater _position) exitWith {};
if ((_position select 2) > 0.2) exitWith {};

_surface = surfaceType _position;

if (_surface != GVAR(surfaceCache)) then {
    GVAR(surfaceCache) = _surface;
    _surface = ([_surface, "#"] call CBA_fnc_split) select 1;
    GVAR(surfaceCacheIsDust) = getNumber (ConfigFile >> "CfgSurfaces" >> _surface >> "dust") >= 0.1;
};

if (!GVAR(surfaceCacheIsDust)) exitWith {};

_bullets = GETDUSTT(DBULLETS);

if ((ACE_diagTime - GETDUSTT(DTIME)) > 1) then {
    _bullets = 0;
};

_bullets = _bullets + 1;
SETDUST(DBULLETS,_bullets);
SETDUST(DTIME,ACE_diagTime);

if (GETDUSTT(DAMOUNT) < 2) then {
    private "_bulletsRequired";
    _bulletsRequired = 100;
    if (isNumber (ConfigFile >> _cloudType >> "ACE_Goggles_BulletCount")) then {
        _bulletsRequired = getNumber (ConfigFile >> _cloudType >> "ACE_Goggles_BulletCount");
    };

    if (_bulletsRequired <= _bullets) then {
        SETDUST(DACTIVE,true);
        call FUNC(applyDust);
    };
};
true
