#include "script_component.hpp"
/*
 * Author: ACE-Team
 * Dev things
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_doSpall
 *
 * Public: No
 */
params ["_projectile", "_hitObj", "", "_lPosASL", "_lVel", "", "", "" ,"_surfaceType"];

if (!isNil "_hitObj" && {_hitObj isKindOf "man"}) exitWith {};

if ((isNil "_lPosASL") || {!(_lPosASL isEqualTypeArray [0,0,0])}) exitWith {WARNING_1("Problem with hitPart data - bad pos [%1]",_lPosASL);};


private _posASL = _lPosASL;
private _vel = [0, 0, 0];
private _lVelUnit = vectorNormalized _lVel;
private _velMod = 1;
if (alive _projectile) then {
        _vel = velocity _projectile; 
        _posASL = getPosASL _projectile; 
        // Dot product math 
    private _diffAngle = acos (_lVelUnit vectorDotProduct vectorNormalized _vel);
        
    if (abs _diffAngle > 45) then {
            SUB(_velMod, (vectorMagnitude _vel) / (vectorMagnitude _lVel));
    };
        _projectile setVariable [QGVAR(lastSpallTime), diag_tickTime ];
};


//** start calculating where the spalling should come  **//
private _unitStep = _lVelUnit vectorMultiply 0.05;
private _spallPos = +_lPosASL;
// exit if we hit the ground
if (terrainIntersectASL [_lPosASL vectorAdd _unitStep, _lPosASL]) exitWith {}; 
// step through
for "_i" from 1 to 20 do 
{
        private _nPos = _spallPos vectorAdd _unitStep;
        if (!lineIntersects [_spallPos, _nPos]) then {break};
        _spallPos = +_nPos;
};
#ifdef DEBUG_MODE_FULL
[_spallPos, "orange"] call FUNC(dev_sphereDraw);
[_lPosASL, "orange"] call FUNC(dev_sphereDraw);
#endif
// find last intersect with the object

private _ammo = typeOf _projectile;
private _explosive = getNumber (configFile >> "CfgAmmo" >> _ammo >> "explosive");

#ifdef DEBUG_MODE_FULL
private _dv = vectorMagnitude _lVel - vectorMagnitude _vel;
private _caliber = getNumber (configFile >> "cfgAmmo" >> _ammo >> "caliber");
systemChat ("dV: " + str _dv + ", caliber: " + str _caliber + ", product: " + str (_caliber*_dv));
#endif

if (_explosive > 0) then {
    // ACE_player sideChat format ["EXPLOSIVE!"];
    //private _warn = false;
    private _c = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_frag_CHARGE");
    if (_c == 0) then {_c = 1}; //; _warn = true;};
    private _m = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_frag_METAL");
    if (_m == 0) then {_m = 2;};// _warn = true;};
    private _k = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_frag_GURNEY_K");
    if (_k == 0) then {_k = 1 / 2;};// _warn = true;};
    private _gC = getNumber (configFile >> "CfgAmmo" >> _ammo >> "ace_frag_GURNEY_C");
    if (_gC == 0) then {_gC = 2440};// _warn = true;};

    // if (_warn) then {
        // WARNING_1("Ammo class %1 lacks proper explosive properties definitions for frag!",_roundType); //TODO: turn this off when we get closer to release
    // };

    _velMod = (((_m / _c) + _k) ^ - (1 / 2)) * _gC * 0.66 * _velMod;
};

// diag_log text format ["SPALL POWER: %1", _spallPolar select 0];
// range of spread 15-40
// N rounds 				5-15
// speed from      0.75-1.5
// range of spread 5-10
// N rounds 			 3-8
// speed from      0.75-1.5
private _velScalar = 0.33 * _velMod;

private _fragSpawner = QGVAR(base) createVehicleLocal [0,0,12345];
_fragSpawner setPosASL _spallPos;
_fragSpawner setVectorDirandUp [vectorDir _projectile, vectorUp _projectile];
_fragSpawner setVelocity (_lVelUnit vectorMultiply _velScalar);


#ifdef DEBUG_MODE_FULL
_fragSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["", "_subProj"];
        [_subProj] call FUNC(dev_addRound);
    }
];
#endif