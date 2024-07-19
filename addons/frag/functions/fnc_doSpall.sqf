#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function check whether a spall event has occured and generates spall.
 *
 * Arguments:
 * 0: The object a projectile hit <OBJECT>
 * 1: The config name of the projectile <STRING>
 * 2: The projectile that should cause spalling <OBJECT>
 * 3: The position the projectile hit the object <ARRAY>
 * 4: The old velocity of the projectile <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[1000, 45, 60], 0.8, getPosASL ace_player] call ace_frag_fnc_doSpall
 *
 * Public: No
 */
params ["_objectHit", "_roundType", "_round", "_oldPos", "_oldVelocity",];

TRACE_1("",_objectHit);
if ((isNil "_objectHit") || {isNull _objectHit}) exitWith {WARNING_1("Problem with hitPart data - bad object [%1]",_objectHit);};

private _caliber = getNumber (configFile >> "CfgAmmo" >> _roundType >> "caliber");
private _explosive = getNumber (configFile >> "CfgAmmo" >> _roundType >> "explosive");
private _idh = getNumber (configFile >> "CfgAmmo" >> _roundType >> "indirectHitRange");

_roundType call FUNC(getSpallInfo) params ["_caliber", "_explosive"];

private _exit = false;
private _vm = 1;

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
            SUB(_vm,_curSpeed / _oldSpeed);
        };
    };
};
if (_exit) exitWith {};

private _unitDir = vectorNormalized _oldVelocity;

private _spallPos = [];
if ((isNil "_oldPos") || {!(_oldPos isEqualTypeArray [0,0,0])}) exitWith {WARNING_1("Problem with hitPart data - bad pos [%1]",_oldPos);};
for "_i" from 0 to 100 do {
    private _pos1 = _oldPos vectorAdd (_unitDir vectorMultiply (0.01 * _i));
    private _pos2 = _oldPos vectorAdd (_unitDir vectorMultiply (0.01 * (_i + 1)));

    if (!lineIntersects [_pos1, _pos2]) exitWith {
        _spallPos = _pos2;
    };
};
if (_spallPos isEqualTo []) exitWith {};
private _spallPolar = _oldVelocity call CBA_fnc_vect2polar;

if (_explosive > 0) then {
    _shellType call FUNC(getFragInfo) params ["", "_fragVelocity"];
    _spallPolar set [0, _fragVelocity * 0.66];
};

private _spread = 15 + (random 25);
private _spallCount = 5 + (random 10);
TRACE_1("",_spallCount);
for "_i" from 1 to _spallCount do {
    private _elev = ((_spallVelocity select 2) - _spread) + (random (_spread * 2));
    private _dir = ((_spallVelocity select 1) - _spread) + (random (_spread * 2));
    if (abs _elev > 90) then {
        ADD(_dir,180);
    };
    _dir = _dir % 360;
    private _vel = (_spallVelocity select 0) * 0.33 * _vm;
    _vel = (_vel - (_vel * 0.25)) + (random (_vel * 0.5));

    private _spallFragVect = [_vel, _dir, _elev] call CBA_fnc_polar2vect;
    private _fragment = (selectRandomWeighted WEIGHTED_SIZE) createVehicle [0, 0, 10000];
    _fragment setPosASL _spallPos;
    _fragment setVelocity _spallFragVect;

    #ifdef DRAW_FRAG_INFO
        [_fragment, "orange", true] call FUNC(dev_trackObj);
    #endif
};

_spread = 5 + (random 5);
_spallCount = 3 + (random 5);
for "_i" from 1 to _spallCount do {
    private _elev = ((_spallVelocity select 2) - _spread) + (random (_spread * 2));
    private _dir = ((_spallVelocity select 1) - _spread) + (random (_spread * 2));
    if (abs _elev > 90) then {
        ADD(_dir,180);
    };
    _dir = _dir % 360;
    private _vel = (_spallVelocity select 0) * 0.55 * _vm;
    _vel = (_vel - (_vel * 0.25)) + (random (_vel * 0.5));

    private _spallFragVect = [_vel, _dir, _elev] call CBA_fnc_polar2vect;
    private _fragment = (selectRandomWeighted WEIGHTED_SIZE) createVehicle [0, 0, 10000];
    _fragment setPosASL _spallPos;
    _fragment setVelocity _spallFragVect;

    #ifdef DRAW_FRAG_INFO
        [_fragment, "orange", true] call FUNC(dev_trackObj);
    #endif
};