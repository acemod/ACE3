#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou
 * Server func to create the fragmentation for a round.
 *
 * Arguments:
 * 0: Last Position (ASL) <ARRAY>
 * 1: Velocity <ARRAY>
 * 2: Ammo Classname <STRING>
 * 3: Shot parents <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[], [], "handGrenade"] call ace_frag_fnc_frago
 *
 * Public: No
 */

#define FRAG_VEC_VAR 0.004
#define MAX_FRAG_COUNT 50

BEGIN_COUNTER(frago);

params ["_lastPos", "_lastVel", "_shellType", "_shotParents"];
TRACE_4("frago",_lastPos,_lastVel,_shellType,_shotParents);

// Limit max frag count if there was a recent frag
private _maxFrags = round (MAX_FRAG_COUNT * linearConversion [ACE_FRAG_COUNT_MIN_TIME, ACE_FRAG_COUNT_MAX_TIME, (CBA_missionTime - GVAR(lastFragTime)), 0.1, 1, true]);
TRACE_2("",_maxFrags,CBA_missionTime - GVAR(lastFragTime));
GVAR(lastFragTime) = CBA_missionTime;

_shellType call ace_frag_fnc_getFragInfo params ["_fragRange", "_fragVelocity", "_fragTypes"];

private _atlPos = ASLtoATL _lastPos;

private _fragVelocityRandom = _fragVelocity * 0.5;

// Post 2.18 change - uncomment line 41, and remove lines 43, 50-55, 64-66
// private _targets = [_posAGL, _fragRange, _fragRange, 0, false, _fragRange] nearEntities [["Car", "Motorcycle", "Tank", "StaticWeapon", "CAManBase", "Air", "Ship"], false, true, true];
private _objects = _posAGL nearEntities [["Car", "Motorcycle", "Tank", "StaticWeapon", "CAManBase", "Air", "Ship"], _fragRange];
if (_objects isEqualTo []) exitWith {
    TRACE_2("No nearby targets",_posAGL,_fragRange);
    0
};

// grab crews and add them in so that targets stay approx. sorted by distance
private _targets = [];
{
    private _crew = crew _x;
    _crew pushBackUnique _x;
    _targets append _crew;
} forEach _objects;
TRACE_2("",_fragRange,count _targets);

private _fragCount = 0;

private _fragArcs = [];
_fragArcs set [360, 0];

if (_targets isNotEqualTo []) then {
    if (GVAR(reflectionsEnabled)) then {
        [_lastPos, _shellType] call FUNC(doReflections);
    };
    {
        private _target = _x;
        if (alive _target) then {
            (boundingBox _target) params ["_boundingBoxA", "_boundingBoxB"];

            private _cubic = ((abs (_boundingBoxA select 0)) + (_boundingBoxB select 0)) * ((abs (_boundingBoxA select 1)) + (_boundingBoxB select 1)) * ((abs (_boundingBoxA select 2)) + (_boundingBoxB select 2));

            if (_cubic <= 1) then {continue};

            private _targetVel = velocity _target;
            private _targetPos = getPosASL _target;
            private _distance = _targetPos vectorDistance _lastPos;
            private _add = ((_boundingBoxB select 2) / 2) + ((((_distance - (_fragVelocity / 8)) max 0) / _fragVelocity) * 10);

            _targetPos = _targetPos vectorAdd [
            (_targetVel select 0) * (_distance / _fragVelocity),
            (_targetVel select 1) * (_distance / _fragVelocity),
            _add
            ];

            private _baseVec = _lastPos vectorFromTo _targetPos;

            private _dir = floor (_baseVec call CBA_fnc_vectDir);
            private _currentCount = RETDEF(_fragArcs select _dir,0);
            if (_currentCount < 10) then {
                private _count = ceil (random (sqrt (_m / 1000)));
                private _vecVar = FRAG_VEC_VAR;
                if !(_target isKindOf "Man") then {
                    ADD(_vecVar,(sqrt _cubic) / 2000);
                    if ((crew _target) isEqualTo [] && {_count > 0}) then {
                        _count = 0 max (_count / 2);
                    };
                };
                for "_i" from 1 to _count do {
                    private _vec = _baseVec vectorDiff [
                    (_vecVar / 2) + (random _vecVar),
                    (_vecVar / 2) + (random _vecVar),
                    (_vecVar / 2) + (random _vecVar)
                    ];

                    private _fp = _fragVelocity - (random (_fragVelocityRandom));
                    private _vel = _vec vectorMultiply _fp;

                    private _fragObj = (selectRandom _fragTypes) createVehicleLocal [0,0,10000];
                    // TRACE_4("targeted",_fp,typeOf _fragObj,_lastPos vectorDistance _targetPos,typeOf _x);
                    _fragObj setPosASL _lastPos;
                    _fragObj setVectorDir _vec;
                    _fragObj setVelocity _vel;
                    _fragObj setShotParents _shotParents;
                    #ifdef DRAW_FRAG_INFO
                    [ACE_player, _fragObj, [1,0,0,1]] call FUNC(dev_addTrack);
                    #endif
                    INC(_fragCount);
                    INC(_currentCount);
                };
                _fragArcs set [_dir, _currentCount];
            };
        };
        if (_fragCount > _maxFrags) exitWith {};
    } forEach _targets;
    TRACE_1("targeted",_fragCount);
    if (_fragCount > _maxFrags) exitWith {};
    private _randomCount = ceil ((_maxFrags - _fragCount) * 0.35);
    TRACE_1("",_randomCount);
    private _sectorSize = 360 / (_randomCount max 1);


    for "_i" from 1 to _randomCount do {
        // Distribute evenly
        private _sectorOffset = 360 * (_i - 1) / (_randomCount max 1);
        private _randomDir = random (_sectorSize);
        _vec = [cos (_sectorOffset + _randomDir), sin (_sectorOffset + _randomDir), sin (30 - (random 45))];

        _fp = (_fragVelocity - (random (_fragVelocityRandom)));

        _vel = _vec vectorMultiply _fp;

        _fragObj = (selectRandom _fragTypes) createVehicleLocal [0, 0, 10000];
        _fragObj setPosASL _lastPos;
        _fragObj setVectorDir _vec;
        _fragObj setVelocity _vel;
        _fragObj setShotParents _shotParents;

        #ifdef DRAW_FRAG_INFO
        [ACE_player, _fragObj, [1,0.5,0,1]] call FUNC(dev_addTrack);
        #endif
        INC(_fragCount);
    };
};

TRACE_1("total created",_fragCount);

END_COUNTER(frago);
