//fnc_frago.sqf
// #define DEBUG_MODE_FULL
#include "script_component.hpp"

#define FRAG_VEC_VAR 0.004

#define MAX_FRAG_COUNT 50

if (!isServer) exitWith {};

BEGIN_COUNTER(frago);
// _startTime = diag_tickTime;

params ["_round", "_lastPos", "_lastVel", "_shellType", "_firedFrame", "_gun"];

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

private _isArmed = true;
if (!isNil "_gun") then {
    private _fuseDist = getNumber(configFile >> "CfgAmmo" >> _shellType >> "fuseDistance");
    _isArmed = ((getPosASL _gun) distance _lastPos > _fuseDist);
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

// _manObjects = _atlPos nearEntities ["CaManBase", _fragRange];

// setAccTime 0.01;

//_objects = nearestObjects [_atlPos, ["AllVehicles"], _fragRange]; // Not sure if tracking "ReammoBox" is required, if so revert this change for _objects
private _objects = _atlPos nearEntities [["Car", "Motorcycle", "Tank", "StaticWeapon", "CAManBase", "Air", "Ship"], _fragRange];

// _objects = _manObjects;
// Add unique crews in faster way
{
    {
        _objects pushBackUnique _x;
    } forEach (crew _x);
} forEach _objects;

private _fragCount = 0;

private _fragArcs = [];
_fragArcs set [360, 0];

#ifdef DEBUG_MODE_FULL
    ACE_player sideChat format ["_fragRange: %1", _fragRange];
    ACE_player sideChat format ["_objects: %1", _objects];
#endif

private _doRandom = true;
if (_isArmed && {!(_objects isEqualTo [])}) then {
    if (GVAR(reflectionsEnabled)) then {
        [_lastPos, _shellType] call FUNC(doReflections);
    };
    {
        //if (random(1) > 0.5) then {
            private _target = _x;
            if (alive _target) then {
                (boundingBox _target) params ["_boundingBoxA", "_boundingBoxB"];

                private _cubic = ((abs (_boundingBoxA select 0)) + (_boundingBoxB select 0)) * ((abs (_boundingBoxA select 1)) + (_boundingBoxB select 1)) * ((abs (_boundingBoxA select 2)) + (_boundingBoxB select 2));

                if (_cubic <= 1) exitWith {};
                _doRandom = true;

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
                if (_currentCount < 20) then {
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

                        private _fragType = round (random ((count _fragTypes) - 1));
                        private _fragObj = (_fragTypes select _fragType) createVehicleLocal [0,0,10000];
                        // diag_log text format ["fp: %1 %2", _fp, typeOf _fragObj];
                        _fragObj setPosASL _lastPos;
                        _fragObj setVectorDir _vec;
                        _fragObj setVelocity _vel;
                        if (GVAR(traceFrags)) then {
                            INC(GVAR(totalFrags));
                            [ACE_player, _fragObj, [1,0,0,1]] call FUNC(addTrack);
                        };
                        INC(_fragCount);
                        INC(_currentCount);
                    };
                    _fragArcs set [_dir, _currentCount];
                };
            };
        //};
        if (_fragCount > MAX_FRAG_COUNT) exitWith {};
    } forEach _objects;
    if (_fragCount > MAX_FRAG_COUNT) exitWith {};
    private _randomCount = ((ceil ((MAX_FRAG_COUNT - _fragCount) * 0.1)) max 0) + 20;
    private _sectorSize = 360 / (_randomCount max 1);
    // _doRandom = false;
    if (_doRandom) then {
        for "_i" from 1 to _randomCount do {
            // Distribute evenly
            private _sectorOffset = 360 * (_i - 1) / (_randomCount max 1);
            private _randomDir = random (_sectorSize);
            _vec = [cos (_sectorOffset + _randomDir), sin (_sectorOffset + _randomDir), sin (30 - (random 45))];

            _fp = (_fragPower - (random (_fragPowerRandom)));

            _vel = _vec vectorMultiply _fp;

            _fragType = round (random ((count _fragTypes) - 1));
            _fragObj = (_fragTypes select _fragType) createVehicleLocal [0, 0, 10000];
            _fragObj setPosASL _lastPos;
            _fragObj setVectorDir _vec;
            _fragObj setVelocity _vel;

            if (GVAR(traceFrags)) then {
                INC(GVAR(totalFrags));
                [ACE_player, _fragObj, [1,0.5,0,1]] call FUNC(addTrack);
            };
            INC(_fragCount);
        };
    };

};
// #ifdef DEBUG_MODE_FULL
    // ACE_player sideChat format["total frags: %1", GVAR(totalFrags)];
    // ACE_player sideChat format["tracks: %1", (count GVAR(trackedObjects))];
// #endif
// _endTime = diag_tickTime;
END_COUNTER(frago);
