#include "script_component.hpp"
/*
 * Author: Lambda.Tiger
 * This function creates spalling if the hit slowed the speed down enough.
 * 
 * Arguments:
 * Arguments are the same as BI's "HitPart" EH:
 * https://community.bistudio.com/wiki/Arma_3:_Event_Handlers#HitPart
 * 
 * Return Value:
 * None
 *
 * Example:
 * [BIS_HITPART_EH_ARGS] call ace_frag_fnc_doSpallMomentum;
 *
 * Public: No
 */
params ["_projectile", "_hitObj", "", "_lPosASL", "_lVel", "", "", "" ,"_surfaceType"];

if (CBA_missionTime - GVAR(lastHitTick) < ACE_FRAG_SPALL_HOLDOFF) exitWith {};

if (_hitObj isNotEqualTo objNull && {_hitObj isKindOf "man"}) exitWith {};
if ((isNil "_lPosASL") || {!(_lPosASL isEqualTypeArray [0,0,0])}) exitWith {
    TRACE_1("Problem with hitPart data - bad pos",_lPosASL);
};

private _vel = if (alive _projectile) then {
        _velocity _projectile; 
} else {
    [0, 0, 0]
};
private _lVelUnit = vectorNormalized _lVel;


// Find spall speed / fragment
private _ammo = typeOf _projectile;
private _dV = vectorMagnitude _lVel - vectorMagnitude _vel;
private _caliber = getNumber (configFile >> "cfgAmmo" >> _ammo >> "caliber"); // !*! optimize this later?
private _deltaMomentum =  0.4 * _caliber * sqrt( _dV * 0.032 );

TRACE_3("found speed",_dV,_caliber,_deltaMomentum);

if (_deltaMomentum < 1) exitWith {
    TRACE_1("lowImpulse",_ammo);
};

//** start calculating where the spalling should come !*! could be better  **// 
private _unitStep = _lVelUnit vectorMultiply 0.05;
private _spallPos = +_lPosASL;
// exit if we hit the ground
if (terrainIntersectASL [_lPosASL vectorAdd _unitStep, _lPosASL]) exitWith {
    TRACE_3("terrainIntersect",_lPosASL,_unitStep,_lPosASL);
}; 
// step through
for "_i" from 1 to 20 do 
{
        private _nPos = _spallPos vectorAdd _unitStep;
        if (!lineIntersects [_spallPos, _nPos]) then { _spallPos = _nPos; break};
        _spallPos = +_nPos;
};

#ifdef DEBUG_MODE_FULL
[_spallPos, "green"] call FUNC(dev_sphereDraw);
[_lPosASL vectorAdd _lVelUnit, "orange"] call FUNC(dev_sphereDraw);
[_lPosASL, "orange"] call FUNC(dev_sphereDraw);
private _str = GVAR(hitLog) getOrDefault [str _surfaceType, "["];
_str =_str + str [_dV, _caliber, abs vectorMagnitude (_lPosASL vectorDiff _spallPos)] + ";";
GVAR(hitLog) set [str _surfaceType, _str];
if (_deltaMomentum < 2) exitWith {};
#endif

//***** Passed all other exit withs, performance o'clock */
GVAR(lastHitTick) = CBA_missionTime;

//***** Select spalled fragments **//
// diag_log text format ["SPALL POWER: %1", _spallPolar select 0];
// range of spread 15-40
// N rounds 				5-15
// speed from      0.75-1.5
// range of spread 5-10
// N rounds 			 3-8
// speed from      0.75-1.5

private _fragSpawnType = switch (true) do 
{
    case (_deltaMomentum < 3): { QGVAR(spall_tiny) };
    case (_deltaMomentum < 5): { QGVAR(spall_small) };
    case (_deltaMomentum < 8): { QGVAR(spall_medium) };
    case (_deltaMomentum < 11): { QGVAR(spall_large) };
    default { QGVAR(spall_huge) };
};


//***** Spawn spalled fragments
private _fragSpawner = createVehicleLocal [_fragSpawnType, ASLToATL _spallPos, [], 0, "CAN_COLLIDE"];
_fragSpawner setVectorDirandUp [vectorDir _projectile, vectorUp _projectile];
_fragSpawner setVelocity _lVelUnit;


#ifdef DEBUG_MODE_FULL
systemChat ("bSpd: " + str speed _fragSpawner + ", frag: " + _fragSpawnType + ", dm: " + str _deltaMomentum);
_fragSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["", "_subProj"];
        [_subProj] call FUNC(dev_addRound);
    }
];
#endif