/*
 * Author: Garth 'L-H' de Wet, commy2
 * Determines whether to place dust on the goggles, based on calibre of weapon fired and other requirements. Called from the unified fired EH only for the local player.
 *
 * Arguments:
 * None. Parameters inherited from EFUNC(common,firedEH)
 *
 * Return Value:
 * Function is handled? <BOOL>
 *
 * Example:
 * call ace_goggles_fnc_handleFired
 *
 * Public: No
 */
#include "script_component.hpp"

//IGNORE_PRIVATE_WARNING ["_unit", "_weapon", "_muzzle", "_mode", "_ammo", "_magazine", "_projectile", "_vehicle", "_gunner", "_turret"];
TRACE_10("firedEH:",_unit, _weapon, _muzzle, _mode, _ammo, _magazine, _projectile, _vehicle, _gunner, _turret);

// no dust in rain
if (rain > 0.1) exitWith {true};

// effect only aplies when lying on the ground
if (stance _unit != "PRONE") exitWith {true};

// check if the unit really is on the ground and not in a building
private _position = getPosATL _unit;

if (_position select 2 > 0.2) exitWith {true};

// get weapon dust effect
private _particleConfig = configFile >> "CfgWeapons" >> _weapon >> "GunParticles";

private _cloudType = "";

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

private _surface = surfaceType _position select [1]; // cuts of the leading #

if (_surface != GVAR(surfaceCache)) then {
    GVAR(surfaceCache) = _surface;
    GVAR(surfaceCacheIsDust) = getNumber (configFile >> "CfgSurfaces" >> _surface >> "dust") >= 0.1;
};

// quit if surface isn't dusty
if (!GVAR(surfaceCacheIsDust)) exitWith {true};

// increment dust value with type bullet
private _bullets = GETDUSTT(DBULLETS);

if (diag_tickTime - GETDUSTT(DTIME) > 1) then {
    _bullets = 0;
};

_bullets = _bullets + 1;

SETDUST(DBULLETS,_bullets);
SETDUST(DTIME,diag_tickTime);

// apply dust effect if the amount of fired bullets is over the threshold
if (GETDUSTT(DAMOUNT) < 2) then {
    private _bulletsRequired = 100;

    if (isNumber (configFile >> _cloudType >> QGVAR(BulletCount))) then {
        _bulletsRequired = getNumber (configFile >> _cloudType >> QGVAR(BulletCount));
    };

    if (_bullets > _bulletsRequired) then {
        SETDUST(DACTIVE,true);
        call FUNC(applyDustEffect);
    };
};

true
