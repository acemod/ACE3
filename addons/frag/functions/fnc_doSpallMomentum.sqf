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
params [
	"_projectile",
	["_hitObj", objNull],
	"",
	["_lPosASL", [0, 0, 0]],
	["_lVel", [0, 0, 0]],
	"",
	"",
	"",
	["_surfaceType", ""]
];

if (CBA_missionTime - GVAR(lastSpallTime) < ACE_FRAG_SPALL_HOLDOFF) exitWith {
	TRACE_2("timeExit",CBA_missionTime,GVAR(lastSpallTime));
};

if (!(isNull _hitObj) && {_hitObj isKindOf "man"}) exitWith {
	TRACE_1("hitPerson",_hitObj);
};

if (_lPosASL isEqualTo [0,0,0]) exitWith {
    TRACE_1("Problem with hitPart data - bad pos",_lPosASL);
};

private _vel = if (alive _projectile) then {
        velocity _projectile; 
} else {
    [0, 0, 0]
};
private _lVelUnit = vectorNormalized _lVel;


// Find spall speed / fragment
private _ammo = typeOf _projectile;
private _dV = vectorMagnitude _lVel - vectorMagnitude _vel;
private _caliber = getNumber (configFile >> "cfgAmmo" >> _ammo >> "caliber"); // !*! optimize this later?
// scaled momentum change made on caliber-mass assumption ~sqrt(2)/20 * caliber ~= mass
private _deltaMomentum =  0.07071 * _caliber * sqrt( _dV ); 

TRACE_3("found speed",_dV,_caliber,_deltaMomentum);

if (_deltaMomentum < 2) exitWith {
    TRACE_1("lowImpulse",_ammo);
};

//** start calculating where the spalling should come !*! could be better  **// 
private _unitStep = _lVelUnit vectorMultiply 0.05;
private _spallPos = +_lPosASL;

if (terrainIntersectASL [_lPosASL vectorAdd _unitStep, _lPosASL]) exitWith {
    TRACE_3("terrainIntersect",_lPosASL,_unitStep,_lPosASL);
}; 
// step through
for "_i" from 1 to 20 do 
{
	private _nPos = _spallPos vectorAdd _unitStep;
	if (!lineIntersects [_spallPos, _nPos]) then {
		_spallPos = _nPos vectorAdd _unitStep;
		break
	};
	_spallPos = _nPos;
};

#ifdef DEBUG_MODE_FULL
[_spallPos, "green"] call FUNC(dev_sphereDraw);
[_lPosASL vectorAdd _lVelUnit, "orange"] call FUNC(dev_sphereDraw);
[_lPosASL, "orange"] call FUNC(dev_sphereDraw);
#endif
 
//***** Passed all other exit withs, performance o'clock */
GVAR(lastSpallTime) = CBA_missionTime;

//***** Select spalled fragment spawner **//

private _material = [_surfaceType] call FUNC(getMaterialInfo);

private _fragSpawnType = switch (true) do 
{
    case (_deltaMomentum < 3): { QGVAR(spall_tiny) };
    case (_deltaMomentum < 5): { QGVAR(spall_small) };
    case (_deltaMomentum < 8): { QGVAR(spall_medium) };
    case (_deltaMomentum < 11): { QGVAR(spall_large) };
    default { QGVAR(spall_huge) };
};

// Shot parent
private _shotParent = getShotParents _projectile;

//***** Spawn spalled fragments
private _spallSpawner = createVehicleLocal [_fragSpawnType, ASLToATL _spallPos, [], 0, "CAN_COLLIDE"];
_spallSpawner setVectorDirandUp [vectorDir _projectile, vectorUp _projectile];
_spallSpawner setVelocity (_lVelUnit vectorMultiply (_dV/2));
_spallSpawner setShotParents _shotParent;

#ifdef DEBUG_MODE_FULL
systemChat ("bSpd: " + str speed _spallSpawner + ", frag: " + _fragSpawnType + ", dm: " + str _deltaMomentum);
_spallSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["", "_subProj"];
        [_subProj] call FUNC(dev_addRound);
    }
];
#endif