#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function check whether a spall event has occured and generates spall.
 *
 * Arguments:
 * 0: The object a projectile hit <OBJECT>
 * 1: The config name of the projectile <STRING>
 * 2: The projectile that should cause spalling <OBJECT>
 * 3: The position (ASL) the projectile hit the object <ARRAY>
 * 4: The old velocity of the projectile <ARRAY>
 * 5: The projectile's instigator, or the second argument of a projectile's shotParents <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [editorPlacedHouse_0, typeOf _projectile, _projectile, [1000, 40, 60], [0, 1000, 0], [objNull, ace_player]] call ace_frag_fnc_doSpall
 *
 * Public: No
 */
#define WEIGHTED_SIZE [QGVAR(spall_small), 4, QGVAR(spall_medium), 3, QGVAR(spall_large), 2, QGVAR(spall_huge), 1]
params ["_objectHit", "_roundType", "_round", "_oldPosASL", "_oldVelocity", "_instigator"];

TRACE_6("",_objectHit,_roundType,_round,_oldPosASL,_oldVelocity,_instigator);
if ((isNil "_objectHit") || {isNull _objectHit}) exitWith {
    TRACE_1("Problem with hitPart data - bad object [%1]",_objectHit);
};

_roundType call FUNC(getSpallInfo) params ["_caliber", "_explosive", "_idh"];

private _exit = false;
private _velocityModifier = 1;

private _curVelocity = velocity _round;
private _oldSpeed = vectorMagnitude _oldVelocity;
private _curSpeed = vectorMagnitude _curVelocity;

if (alive _round) then {
    private _diff = _oldVelocity vectorDiff _curVelocity;
    private _polar = _diff call CBA_fnc_vect2polar;

    if (abs (_polar select 1) > 45 || {abs (_polar select 2) > 45}) then {
        if (_caliber < 2.5) then {
            _exit = true;
        } else {
            SUB(_velocityModifier,_curSpeed / _oldSpeed);
        };
    };
};
if (_exit) exitWith {
    TRACE_1("exit alive",_caliber);
};

private _unitDir = vectorNormalized _oldVelocity;

if ((isNil "_oldPosASL") || {!(_oldPosASL isEqualTypeArray [0,0,0])}) exitWith {WARNING_1("Problem with hitPart data - bad pos [%1]",_oldPosASL);};
private _pos1 = _oldPosASL;
private _spallPosAGL = _pos1;
private _searchStepSize = _unitDir vectorMultiply 0.05;
for "_i" from 0 to 20 do {
    _spallPosAGL = _pos1 vectorAdd _searchStepSize;
    if (!lineIntersects [_pos1, _spallPosAGL]) exitWith {};
    _pos1 = _spallPosAGL;
};
if (_spallPosAGL isEqualTo _pos1) exitWith {
    TRACE_1("can't find other side",_oldPosASL);
};
_spallPosAGL = ASLToAGL _spallPosAGL;

_instigator setVariable [QGVAR(nextSpallEvent), CBA_missionTime + ACE_FRAG_SPALL_UNIT_HOLDOFF];
private _oldVelocitySpherical = _oldVelocity call CBA_fnc_vect2polar;

if (_explosive > 0) then {
    _roundType call FUNC(getFragInfo) params ["", "_fragVelocity"];
    _oldVelocitySpherical set [0, _fragVelocity * 0.66];
};
TRACE_2("spallPosandVel",_spallPosAGL,_oldVelocitySpherical);

private _spread = 15 + (random 25);
private _spallCount = 5 + (random 10);
TRACE_1("",_spallCount);
for "_i" from 1 to _spallCount do {
    private _fragmentElevation = ((_oldVelocitySpherical select 2) - _spread) + (random (_spread * 2));
    private _fragmentAzimuth = ((_oldVelocitySpherical select 1) - _spread) + (random (_spread * 2));
    if (abs _fragmentElevation > 90) then {
        ADD(_fragmentAzimuth,180);
    };
    _fragmentAzimuth = _fragmentAzimuth % 360;
    private _fragmentSpeed = (_oldVelocitySpherical select 0) * 0.33 * _velocityModifier;
    _fragmentSpeed = _fragmentSpeed * (0.75 + random 0.5);

    private _spallFragVect = [_fragmentSpeed, _fragmentAzimuth, _fragmentElevation] call CBA_fnc_polar2vect;
    private _fragment = createVehicleLocal [selectRandomWeighted WEIGHTED_SIZE, _spallPosAGL, [], 0, "CAN_COLLIDE"];
    _fragment setVelocity _spallFragVect;
    _fragment setShotParents _shotParents;

    #ifdef DEBUG_MODE_DRAW
    [_fragment, "orange", true] call FUNC(dev_trackObj);
    #endif
};

_spread = 5 + (random 5);
_spallCount = 3 + (random 5);
for "_i" from 1 to _spallCount do {
    private _fragmentElevation = ((_oldVelocitySpherical select 2) - _spread) + (random (_spread * 2));
    private _fragmentAzimuth = ((_oldVelocitySpherical select 1) - _spread) + (random (_spread * 2));
    if (abs _fragmentElevation > 90) then {
        ADD(_fragmentAzimuth,180);
    };
    _fragmentAzimuth = _fragmentAzimuth % 360;
    private _fragmentSpeed = (_oldVelocitySpherical select 0) * 0.55 * _velocityModifier;
    _fragmentSpeed = _fragmentSpeed * (0.75 + random 0.5);

    private _spallFragVect = [_fragmentSpeed, _fragmentAzimuth, _fragmentElevation] call CBA_fnc_polar2vect;
    private _fragment = createVehicleLocal [selectRandomWeighted WEIGHTED_SIZE, _spallPosAGL, [], 0, "CAN_COLLIDE"];
    _fragment setVelocity _spallFragVect;
    _fragment setShotParents _shotParents;

    #ifdef DEBUG_MODE_DRAW
    [_fragment, "purple", true] call FUNC(dev_trackObj);
    #endif
};
