#include "script_component.hpp"
/*
 * Author: Jaynus, NouberNou
 * Server func to create the fragmentation for a round.
 *
 * Arguments:
 * 0: Last Position (ASL) <ARRAY>
 * 1: Velocity <ARRAY>
 * 2: Ammo Classname <STRING>
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

params ["_lastPos", "_lastVel", "_shellType"];
TRACE_3("frago",_lastPos,_lastVel,_shellType);

// Limit max frag count if there was a recent frag
private _maxFrags = round (MAX_FRAG_COUNT * linearConversion [0.1, 1.5, (CBA_missionTime - GVAR(lastFragTime)), 0.1, 1, true]);
TRACE_2("",_maxFrags,CBA_missionTime - GVAR(lastFragTime));
GVAR(lastFragTime) = CBA_missionTime;

private _fragTypes = [
    QGVAR(tiny), QGVAR(tiny), QGVAR(tiny),
    QGVAR(tiny_HD), QGVAR(tiny_HD), QGVAR(tiny_HD),
    QGVAR(small), QGVAR(small), QGVAR(small), QGVAR(small),
    QGVAR(small_HD), QGVAR(small_HD), QGVAR(small_HD), QGVAR(small_HD),
    QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD)
];

private _warn = false;
if (isArray (configFile >> "CfgAmmo" >> _shellType >> QGVAR(CLASSES))) then {
    _fragTypes = getArray (configFile >> "CfgAmmo" >> _shellType >> QGVAR(CLASSES));
} else {
    _warn = true;
};

private _indirectHitRange = getNumber(configFile >> "CfgAmmo" >> _shellType >> "indirecthitrange");
private _fragRange = 20 * _indirectHitRange * 4;
// _c = 185; // grams of comp-b
// _m = 210; // grams of fragmentating metal
// _k = 3/5; // spherical K factor
// _gC = 2843; // Gurney constant of comp-b in /ms

// _c = 429; // grams of tritonal
// _m = 496; // grams of fragmentating metal
// _k = 1/2; // spherical K factor
// _gC = 2320; // Gurney constant of tritonal in /ms

private _c = getNumber (configFile >> "CfgAmmo" >> _shellType >> QGVAR(CHARGE));
if (_c == 0) then {_c = 1; _warn = true;};
private _m = getNumber (configFile >> "CfgAmmo" >> _shellType >> QGVAR(METAL));
if (_m == 0) then {_m = 2; _warn = true;};
private _k = getNumber (configFile >> "CfgAmmo" >> _shellType >> QGVAR(GURNEY_K));
if (_k == 0) then {_k = 0.5; _warn = true;};
private _gC = getNumber (configFile >> "CfgAmmo" >> _shellType >> QGVAR(GURNEY_C));
if (_gC == 0) then {_gC = 2440; _warn = true;};

if (_warn) then {
    INFO_1("Ammo class %1 lacks proper explosive properties definitions for frag!",_shellType);
};

// Gunery equation is for a non-fragmenting metal, imperical value of 80% represents fragmentation
private _fragPower = 0.8 * (((_m / _c) + _k) ^ - (1 / 2)) * _gC;

private _atlPos = ASLtoATL _lastPos;

private _fragPowerRandom = _fragPower * 0.5;
if ((_atlPos select 2) < 0.5) then {
    _lastPos vectorAdd [0, 0, 0.5];
};

private _objects = _atlPos nearEntities [["Car", "Motorcycle", "Tank", "StaticWeapon", "CAManBase", "Air", "Ship"], _fragRange];
// Add unique crews in faster way
{
    {
        _objects pushBackUnique _x;
    } forEach (crew _x);
} forEach _objects;
TRACE_2("",_fragRange,count _objects);

private _fragCount = 0;

private _fragArcs = [];
_fragArcs set [360, 0];

private _doRandom = true;
if (!(_objects isEqualTo [])) then {
    if (GVAR(reflectionsEnabled)) then {
        [_lastPos, _shellType] call FUNC(doReflections);
    };
    {
        private _target = _x;
        if (alive _target) then {
            (boundingBox _target) params ["_boundingBoxA", "_boundingBoxB"];

            private _cubic = ((abs (_boundingBoxA select 0)) + (_boundingBoxB select 0)) * ((abs (_boundingBoxA select 1)) + (_boundingBoxB select 1)) * ((abs (_boundingBoxA select 2)) + (_boundingBoxB select 2));

            if (_cubic <= 1) exitWith {};
            // _doRandom = true;

            private _targetVel = velocity _target;
            private _targetPos = getPosASL _target;
            private _distance = _targetPos vectorDistance _lastPos;
            private _add = ((_boundingBoxB select 2) / 2) + ((((_distance - (_fragpower / 8)) max 0) / _fragPower) * 10);

            _targetPos = _targetPos vectorAdd [
            (_targetVel select 0) * (_distance / _fragPower),
            (_targetVel select 1) * (_distance / _fragPower),
            _add
            ];

            private _baseVec = _lastPos vectorFromTo _targetPos;

            private _dir = floor (_baseVec call CBA_fnc_vectDir);
            private _currentCount = RETDEF(_fragArcs select _dir,0);
            if (_currentCount < 10) then {
                private _count = ceil (random (sqrt (_m / 1000)));
                private _vecVar = FRAG_VEC_VAR;
                if (!(_target isKindOf "Man")) then {
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

                    private _fp = _fragPower - (random (_fragPowerRandom));
                    private _vel = _vec vectorMultiply _fp;

                    private _fragObj = (selectRandom _fragTypes) createVehicleLocal [0,0,10000];
                    // TRACE_4("targeted",_fp, typeOf _fragObj,_lastPos vectorDistance _targetPos,typeOf _x);
                    _fragObj setPosASL _lastPos;
                    _fragObj setVectorDir _vec;
                    _fragObj setVelocity _vel;
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
    } forEach _objects;
    TRACE_1("targeted",_fragCount);
    if (_fragCount > _maxFrags) exitWith {};
    private _randomCount = ceil ((_maxFrags - _fragCount) * 0.35);
    TRACE_1("",_randomCount);
    private _sectorSize = 360 / (_randomCount max 1);

    if (_doRandom) then {
        for "_i" from 1 to _randomCount do {
            // Distribute evenly
            private _sectorOffset = 360 * (_i - 1) / (_randomCount max 1);
            private _randomDir = random (_sectorSize);
            _vec = [cos (_sectorOffset + _randomDir), sin (_sectorOffset + _randomDir), sin (30 - (random 45))];

            _fp = (_fragPower - (random (_fragPowerRandom)));

            _vel = _vec vectorMultiply _fp;

            _fragObj = (selectRandom _fragTypes) createVehicleLocal [0, 0, 10000];
            _fragObj setPosASL _lastPos;
            _fragObj setVectorDir _vec;
            _fragObj setVelocity _vel;

            #ifdef DRAW_FRAG_INFO
            [ACE_player, _fragObj, [1,0.5,0,1]] call FUNC(dev_addTrack);
            #endif
            INC(_fragCount);
        };
    };
};

TRACE_1("total created",_fragCount);

END_COUNTER(frago);
