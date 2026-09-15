#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * Server func to create the fragmentation for a round.
 *
 * Arguments:
 * 0: ASL position projetile is fragmenting at <ARRAY>
 * 1: Projectile ammo classname <STRING>
 *
 * Return Value:
 * The number of fragments created <NUMBER>
 *
 * Example:
 * [[], [], "handGrenade"] call ace_frag_fnc_frago
 *
 * Public: No
 */

#define FRAG_VEC_VAR 0.008

BEGIN_COUNTER(frago);

params ["_fragPosASL", "_shellType"];
TRACE_2("frago",_fragPosASL,_shellType);

// Limit max frag count if there was a recent frag
private _maxFrags = round linearConversion [
    ACE_FRAG_COUNT_MIN_TIME,
    ACE_FRAG_COUNT_MAX_TIME,
    (CBA_missionTime - GVAR(lastFragTime)),
    ACE_FRAG_COUNT_MIN,
    ACE_FRAG_COUNT_MAX,
    true
];
TRACE_2("",_maxFrags,CBA_missionTime - GVAR(lastFragTime));
GVAR(lastFragTime) = CBA_missionTime;

_shellType call FUNC(getFragInfo) params ["_fragRange", "_fragVelocity", "_fragTypes", "_metalMassModifier"];

private _fragPosAGL = ASLToAGL _fragPosASL;
TRACE_5("fragValues",_fragPosASL,_fragPosAGL,_fragRange,_fragVelocity,_metalMassModifier);

// Compile possible targets including units, vehicles, and crews
private _targets = [_fragPosAGL, _fragRange, _fragRange, 0, false, _fragRange] nearEntities [["Car", "Motorcycle", "Tank", "StaticWeapon", "CAManBase", "Air", "Ship"], false, true, true];
if (_targets isEqualTo []) exitWith {
    TRACE_2("No nearby targets",_fragPosAGL,_fragRange);
    0 // return
};
TRACE_3("",_fragRange,count _targets,_targets);

// sort by distance
private _targetsSort = _targets apply { [_x distanceSqr _fragPosAGL, _x] };
_targetsSort sort true;
_targets = _targetsSort apply {_x#1};

private _fragCount = 0;
private _fragArcs = [];
_fragArcs set [360, 0];

if (GVAR(reflectionsEnabled)) then {
    [_fragPosASL, _shellType] call FUNC(doReflections);
};
{
    private _target = _x;
    if (getNumber ((configOf _target) >> "isPlayableLogic") == 0) then {
        (boundingBox _target) params ["_boundingBoxA", "_boundingBoxB"];

        private _cubic = ((abs (_boundingBoxA select 0)) + (_boundingBoxB select 0)) * ((abs (_boundingBoxA select 1)) + (_boundingBoxB select 1)) * ((abs (_boundingBoxA select 2)) + (_boundingBoxB select 2));

        if (_cubic <= 1) exitWith {};

        private _targetVel = velocity _target;
        private _targetPos = getPosASL _target;
        private _distance = _target distance _fragPosAGL;
        private _add = ((_boundingBoxB select 2) / 2) + ((((_distance - (_fragVelocity / 8)) max 0) / _fragVelocity) * 10);

        _targetPos = _targetPos vectorAdd [
            (_targetVel select 0) * (_distance / _fragVelocity),
            (_targetVel select 1) * (_distance / _fragVelocity),
            _add
        ];

        private _baseVec = _fragPosASL vectorFromTo _targetPos;

        private _dir = floor (_baseVec call CBA_fnc_vectDir);
        private _currentCount = RETDEF(_fragArcs select _dir,0);
        if (_currentCount < 10) then {
            private _count = ceil (random _metalMassModifier);
            private _vecVar = FRAG_VEC_VAR;
            if !(_target isKindOf "CAManBase") then {
                ADD(_vecVar,(sqrt _cubic) / 2000);
                if ((crew _target) isEqualTo [] && {_count > 0}) then {
                    _count = 0 max (_count / 2);
                };
            };
            private _vecVarHalf = _vecVar / 2;
            for "_i" from 1 to _count do {
                private _vectorDir = _baseVec vectorDiff [
                    _vecVarHalf - (random _vecVar),
                    _vecVarHalf - (random _vecVar),
                    _vecVarHalf - (random _vecVar)
                ];

                private _fragObjSpeed = _fragVelocity * (1 - random 0.5);
                private _fragObjVelocity = _vectorDir vectorMultiply _fragObjSpeed;

                private _fragObj = createVehicleLocal [selectRandom _fragTypes, _fragPosAGL, [], 0, "CAN_COLLIDE"];
                _fragObj setVectorDir _vectorDir;
                _fragObj setVelocity _fragObjVelocity;
                #ifdef DEBUG_MODE_DRAW
                [_fragObj, "green", true] call FUNC(dev_trackObj);
                if (GVAR(dbgSphere)) then {
                    [_targetPos, "(0.88,0.36,0.92,0.8)"] call FUNC(dev_sphereDraw);
                };
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
if (_fragCount > _maxFrags) exitWith { _fragCount };
private _randomCount = ceil ((_maxFrags - _fragCount) * 0.35);
TRACE_1("",_randomCount);
private _sectorSize = 360 / (_randomCount max 1);

for "_i" from 1 to _randomCount do {
    // Distribute evenly
    private _sectorOffset = 360 * (_i - 1) / (_randomCount max 1);
    private _randomDir = random (_sectorSize);
    private _vectorDir = [cos (_sectorOffset + _randomDir), sin (_sectorOffset + _randomDir), sin (30 - (random 45))];

    private _fragObjSpeed = _fragVelocity * (1 - random 0.5);
    private _fragObjVelocity = _vectorDir vectorMultiply _fragObjSpeed;

    private _fragObj = createVehicleLocal [selectRandom _fragTypes, _fragPosAGL, [], 0, "CAN_COLLIDE"];
    _fragObj setVectorDir _vectorDir;
    _fragObj setVelocity _fragObjVelocity;

    #ifdef DEBUG_MODE_DRAW
    [_fragObj, "blue", true] call FUNC(dev_trackObj);
    #endif
    INC(_fragCount);
};

TRACE_1("total created",_fragCount);

END_COUNTER(frago);
_fragCount // return
