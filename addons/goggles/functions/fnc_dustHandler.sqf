/*
 * Author: Garth 'L-H' de Wet, commy2
 * Determines whether to place dust on the goggles, based on calibre of weapon fired and other requirements.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * Function is handled? <BOOL>
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_weapon"];

if (_unit != ACE_player) exitWith {true};

// no dust in rain
if (rain > 0.1) exitWith {true};

// effect only aplies when lying on the ground
if (stance _unit != "PRONE") exitWith {true};

private ["_position", "_particleConfig", "_cloudType", "_surface", "_bullets"];

// check if the unit really is on the ground and not in a building
_position = getPosATL _unit;

if (_position select 2 > 0.2) exitWith {true};

// get weapon dust effect
_particleConfig = configFile >> "CfgWeapons" >> _weapon >> "GunParticles";

_cloudType = "";

if (isClass (_particleConfig >> "FirstEffect")) then { // @todo read this with custom / non-standard config classnames
    _cloudType = getText (_particleConfig >> "FirstEffect" >> "effectName");
} else {
    if (isClass (_particleConfig >> "effect1")) then {
        _cloudType = getText (_particleConfig >> "effect1" >> "effectName");
    };
};

// quit if the weapon causes no dust effect
if (_cloudType == "") exitWith {true};

// get if the surface is dusty
if (surfaceIsWater _position) exitWith {true};

_surface = surfaceType _position select [1]; // cuts of the leading #

if (_surface != GVAR(surfaceCache)) then {
    GVAR(surfaceCache) = _surface;
    GVAR(surfaceCacheIsDust) = getNumber (configFile >> "CfgSurfaces" >> _surface >> "dust") >= 0.1;
};

// quit if surface isn't dusty
if (!GVAR(surfaceCacheIsDust)) exitWith {true};

// increment dust value with type bullet
_bullets = GETDUSTT(DBULLETS);

if (ACE_diagTime - GETDUSTT(DTIME) > 1) then {
    _bullets = 0;
};

_bullets = _bullets + 1;

SETDUST(DBULLETS,_bullets);
SETDUST(DTIME,ACE_diagTime);

// apply dust effect if the amount of fired bullets is over the threshold
if (GETDUSTT(DAMOUNT) < 2) then {
    local _bulletsRequired = 100;

    if (isNumber (configFile >> _cloudType >> QGVAR(BulletCount))) then {
        _bulletsRequired = getNumber (configFile >> _cloudType >> QGVAR(BulletCount));
    };

    if (_bullets > _bulletsRequired) then {
        SETDUST(DACTIVE,true);
        call FUNC(applyDustEffect);
    };
};

true
