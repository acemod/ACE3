#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function creates fragments targeted at specific entities, up to
 * a configured maximum
 *
 * Arguments:
 * 0: Position of fragmenting projectile ASL <ARRAY>
 * 1: Velocity of the fragmenting projectile <ARRAY>
 * 2: Maximum range of fragments to calculate <SCALAR>
 * 3: Maximum number of fragments to produce <SCALAR>
 * 4: Types of fragments <ARRAY>
 * 5: A modified parameter used to calulate whether a framgent hits <SCALAR>
 * 6: Shot parent <ARRAY>
 *
 * Return Value:
 * Number of fragments created <SCALAR>
 *
 * Example:
 * [getPosASL _proj, velocity _proj, 50, 50, [], 1, [player, player]] call ace_frag_fnc_doFragTargeted;
 *
 * Public: No
 */

params [
    "_posASL",
    ["_fragVel", 800, [123]],
    ["_fragRange", 50, [123]],
    ["_maxFrags",  20, [123]],
    ["_fragTypes", [], [[]]],
    ["_modFragCount", 1, [123]],
    ["_shotPrnt", [objNull, objNull], [[]], [2]]
];
TRACE_5("fnc_doFragTargeted", _posASL, _fragRange, _maxFrags, _fragTypes, _modFragCount);

if (_fragTypes isEqualTo []) then {
    _fragTypes = [
        QGVAR(tiny), QGVAR(tiny), QGVAR(tiny),
        QGVAR(tiny_HD), QGVAR(tiny_HD), QGVAR(tiny_HD),
        QGVAR(small), QGVAR(small), QGVAR(small), QGVAR(small),
        QGVAR(small_HD), QGVAR(small_HD), QGVAR(small_HD), QGVAR(small_HD),
        QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD), QGVAR(medium_HD)
    ];
};

private _objects = (ASLToATL _posASL) nearEntities [["Car", "Motorcycle", "Tank", "StaticWeapon", "CAManBase", "Air", "Ship"], _fragRange];
if (_objects isEqualTo []) exitWith {
    TRACE_2("No nearby targets", _posASL, _fragRange);
    0;
};


// grab crews and add them in so that targets stay approx. sorted by distance
{
    private _crew = (crew _x);
    if (count _crew > 1) then {
        private _arr = [_x];
        {
            _arr pushBackUnique _x;
        } forEach _crew;

        _objects set [_forEachIndex, _arr];
    };
} forEach _objects;
_objects = flatten _objects;
TRACE_3("Targets found", _posASL, _fragRange, count _objects);

// limit number of fragments per direction (2D) to 10 using _fragArcs
private _fragArcs = createHashMap;
private _fragCount = 0;
{ // Begin of forEach iterating on _objects
    if (!alive _x) then {continue};
    private _target = _x;

    #ifdef DEBUG_MODE_DRAWFRAG
    [_target, false] call FUNC(dev_trackHitBox);
    #endif

    // Estimate volume and height of target
    private _height = 0.5;
    private _crossSectionArea = 1;
    private _isPerson = _target isKindOf "CAManBase";
    if (_isPerson) then {
        private _stance = stance _target;
        switch (true) do {
            case (_stance isEqualTo "STAND"): {_height = 1.9; _crossSectionArea = 1.5;};
            case (_stance isEqualTo "CROUCH"): {_height = 1.2; _crossSectionArea = 1;};
            default {_crossSectionArea = 0.75;};
        };
    } else {
        private  _boxParams = boundingBoxReal [_target, "FireGeometry"];
        _boxParams params ["_pointA", "_pointB"];
        private _dims = _pointB vectorDiff _pointA;
        if (_dims#0 * _dims#1 * _dims#2 <= 0.5) then {continue};
        _crossSectionArea = _dims#1 * _dims#2;
        _height = _dims#2;
    };




    private _distance = _target distance _posASL;

    // calculate chance to be hit by a fragment
    private _fragChance = _crossSectionArea * _modFragCount / _distance^2;
    private _count = if (_fragChance > 1) then {
        3 min (floor _fragChance);
    } else {
        [0, 1] select (GVAR(atLeastOne) || {random 1 < _fragChance});
    };
    if (_count == 0) then {TRACE_2("fragments",_fragChance,_count); continue};

    // Approximate offset to hit including speed & gravity
    private _locFragVel = _fragVel * (1 - random 0.5);
    private _tof = _distance / _locFragVel;

    // handle limiting fragments per degree arc
    private _dir = floor (_posASL getDir _target);
    private _fragPerArc = _fragArcs getOrDefault [_dir, 0];
    if (_fragPerArc > 10) then {
        continue;
    } else {
        _fragArcs set [_dir, _fragPerArc + _count];
    };

    // target pos for fragment to hit
    private _targetPos = (velocity _target vectorMultiply _tof) vectorAdd [0, 0, 9.81 / 2 * _tof ^ 2];
    if _isPerson then {
        private _hitPoint =  selectRandom ACE_FRAG_HITPOINTS;
        private _hitPointPos = _target selectionPosition [_hitPoint, "HitPoints", "AveragePoint"];
        _targetPos = _target modelToWorldWorld _hitPointPos vectorAdd _targetPos;
    } else {
        _targetPos = _targetPos vectorAdd getPosASL _target vectorAdd [
            -0.5 + random 1,
            -0.5 + random 1,
            (0.1 + random 0.4) * _height
        ];
    };

    // select a fragment / submunition frag spawner
    private _fragSpawner = selectRandom _fragTypes;
    if (_count > 1) then {
        _fragSpawner = _fragSpawner + "_spawner_" + str _count + (switch (true) do {
            case (_distance < 10): {"_short"};
            case (_distance < 20): {"_mid"};
            default {"_far"};
        });
    };
    TRACE_4("fragments",_fragSpawner,_fragChance,_distance,_locFragVel);

    // Create fragment
    private _vecDir = _posASL vectorFromTo _targetPos;
    private _fragObj = createVehicle [_fragSpawner, ASLtoATL _posASL, [], 0, "CAN_COLLIDE"];
    _fragObj setVectorDir _vecDir;
    _fragObj setVelocity (_vecDir vectorMultiply _locFragVel);
    _fragObj setShotParents _shotPrnt;
    #ifdef DEBUG_MODE_DRAW
    [_fragObj, "purple", true] call FUNC(dev_trackObj);
    if (GVAR(dbgSphere)) then {
        [_targetPos, "orange"] call FUNC(dev_sphereDraw);
    };
    #endif

    _fragCount = _fragCount + _count;
    if (_fragCount >= _maxFrags) then {
        TRACE_2("maxFrags", _fragCount, _maxFrags);
        break
    };
} forEach _objects;

#ifdef DEBUG_MODE_FULL
systemChat ("fragCount cnt: " + str _fragCount);
TRACE_1("fragCount",_fragCount);
#endif
_fragCount