/*
 * Author: Garth 'L-H' de Wet
 * Handles "fired" event and determines if dust is applied to the goggles overlay based on calibre of weapon fired and other requirements.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * player addEventHandler ["Fired", ace_goggles_fnc_handleFired];
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit","_weapon","_muzzle","_mode","_ammo","_magazine","_projectile"];
private ["_bullets", "_position", "_surface", "_cloudType"];

if ((GVAR(showGoggles) == 0) || {_unit != GETUNIT}) exitWith {};

// Rain cleans dust, no dust standing up
if (((stance _unit) != "PRONE") || (rain > 0.1)) exitWith {};

// No dust in water or air
_position = getPosATL _unit;
if ((surfaceIsWater _position) || ((_position select 2) > 0.2)) exitWith {};

// Dust type
_cloudType = "";

if (isClass (configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "FirstEffect")) then {
    _cloudType = getText(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "FirstEffect" >> "effectName");
} else {
    if (isClass (configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "effect1")) then {
        _cloudType = getText(configFile >> "CfgWeapons" >> _weapon >> "GunParticles" >> "effect1" >> "effectName");
    };
};

if (_cloudType == "") exitWith {};

_surface = surfaceType _position;

if (_surface != GVAR(surfaceCache)) then {
    GVAR(surfaceCache) = _surface;
    _surface = ([_surface, "#"] call CBA_fnc_split) select 1;
    GVAR(surfaceCacheIsDust) = getNumber (configFile >> "CfgSurfaces" >> _surface >> "dust") >= 0.1;
};

if !(GVAR(surfaceCacheIsDust)) exitWith {};

_bullets = GETDUSTT(_unit,DBULLETS);

if ((ACE_diagTime - GETDUSTT(_unit,DTIME)) > 1) then {
    _bullets = 0;
};

_bullets = _bullets + 1;
SETDUST(_unit,DBULLETS,_bullets);
SETDUST(_unit,DTIME,ACE_diagTime);

if (GETDUSTT(_unit,DAMOUNT) < 2) then {
    private "_bulletsRequired";
    _bulletsRequired = 100;
    if (isNumber (configFile >> _cloudType >> "ACE_Goggles_BulletCount")) then {
        _bulletsRequired = getNumber (configFile >> _cloudType >> "ACE_Goggles_BulletCount");
    };

    if (_bulletsRequired <= _bullets) then {
        SETDUST(_unit,DACTIVE,true);
        [] call FUNC(applyDust);
    };
};
