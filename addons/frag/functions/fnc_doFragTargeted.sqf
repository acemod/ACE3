#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function creates fragments targeted at specific entities, up to
 * a configured maximum.
 *
 * Arguments:
 * 0: Position of fragmenting projectile ASL <ARRAY>
 * 1: Velocity of the fragmenting projectile <ARRAY>
 * 2: Maximum range of fragments to calculate <NUMBER>
 * 3: Maximum number of fragments to produce <NUMBER>
 * 4: Types of fragments <ARRAY>
 * 5: A modified parameter used to calculate whether a fragment hits <NUMBER>
 * 6: Shot parent <ARRAY>
 *
 * Return Value:
 * Number of fragments created <NUMBER>
 *
 * Example:
 * [getPosASL _proj, velocity _proj, 50, 50, [], 1, [player, player]] call ace_frag_fnc_doFragTargeted;
 *
 * Public: No
 */

params [
    "_posASL",
    "_fragVelocity",
    "_fragRange",
    "_maxFrags",
    "_fragTypes",
    "_modFragCount",
    "_shotParents"
];
TRACE_5("fnc_doFragTargeted",_posASL,_fragRange,_maxFrags,_fragTypes,_modFragCount);

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
    TRACE_2("No nearby targets",_posASL,_fragRange);
    0;
};

// grab crews and add them in so that targets stay approx. sorted by distance
{
    private _crew = crew _x;
    if (_crew isNotEqualTo []) then {
        private _arr = [_x];
        {
            _arr pushBackUnique _x;
        } forEach _crew;

        _objects set [_forEachIndex, _arr];
    };
} forEach _objects;
_objects = flatten _objects;
TRACE_3("Targets found",_posASL,_fragRange,count _objects);

// limit number of fragments per direction (2D) to 10 using _fragArcs
private _fragArcs = createHashMap;
private _totalFragCount = 0;
{ // Begin of forEach iterating on _objects
    if (!alive _x) then {
        continue;
    };
    private _target = _x;

    #ifdef DEBUG_MODE_DRAW
    [_target, false] call FUNC(dev_trackHitBox);
    #endif

    // Estimate volume and height of target
    private _height = 0.5;
    private _crossSectionArea = 1;
    private _isPerson = _target isKindOf "CAManBase";
    if (_isPerson) then {
        switch (stance _target) do {
            case "STAND": {_height = 1.9; _crossSectionArea = 1.5;};
            case "CROUCH": {_height = 1.2; _crossSectionArea = 1;};
            default {_crossSectionArea = 0.75;};
        };
    } else {
        private _boxParams = boundingBoxReal [_target, "FireGeometry"];
        _boxParams params ["_pointA", "_pointB"];
        private _dims = _pointB vectorDiff _pointA;
        if (_dims#0 * _dims#1 * _dims#2 <= 0.5) then {
            continue;
        };
        _crossSectionArea = _dims#1 * _dims#2;
        _height = _dims#2;
    };

    private _distance = _target distance _posASL;

    // calculate chance to be hit by a fragment
    private _fragChance = _crossSectionArea * _modFragCount / _distance^2;
    private _fragCount = if (_fragChance > 1) then {
        3 min (floor _fragChance);
    } else {
        [0, 1] select (GVAR(atLeastOne) || {random 1 < _fragChance});
    };
    if (_fragCount == 0) then {
        TRACE_2("fragments",_fragChance,_fragCount);
        continue;
    };

    // handle limiting fragments per degree arc
    private _dir = floor (_posASL getDir _target);
    private _fragPerArc = _fragArcs getOrDefault [_dir, 0];
    if (_fragPerArc > 10) then {
        continue;
    } else {
        _fragArcs set [_dir, _fragPerArc + _fragCount];
    };

    // Approximate offset to hit including speed & gravity
    private _locFragVel = _fragVelocity * (1 - random 0.5);
    private _timeOfFlight = _distance / _locFragVel;

    // target pos for fragment to hit
    private _targetPos = (velocity _target vectorMultiply _timeOfFlight) vectorAdd [0, 0, ACE_FRAG_HALF_GRAVITY_APPROX * _timeOfFlight ^ 2];
    if _isPerson then {
        private _hitPoint = selectRandom ACE_FRAG_HITPOINTS;
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
    if (_fragCount > 1) then {
        _fragSpawner = _fragSpawner + "_spawner_" + str _fragCount + (switch (true) do {
            case (_distance < 10): {"_short"};
            case (_distance < 20): {"_mid"};
            default {"_far"};
        });
    };
    TRACE_4("fragments",_fragSpawner,_fragChance,_distance,_locFragVel);

    // Create fragment
    private _vectorDir = _posASL vectorFromTo _targetPos;
    private _fragObj = createVehicle [_fragSpawner, ASLtoATL _posASL, [], 0, "CAN_COLLIDE"];
    _fragObj setVectorDir _vectorDir;
    _fragObj setVelocity (_vectorDir vectorMultiply _locFragVel);
    _fragObj setShotParents _shotParents;
    #ifdef DEBUG_MODE_DRAW
    [_fragObj, "purple", true] call FUNC(dev_trackObj);
    if (GVAR(dbgSphere)) then {
        [_targetPos, "orange"] call FUNC(dev_sphereDraw);
    };
    #endif

    _totalFragCount = _totalFragCount + _fragCount;
    if (_totalFragCount >= _maxFrags) then {
        TRACE_2("maxFrags", _totalFragCount, _maxFrags);
        break;
    };
} forEach _objects;

#ifdef DEBUG_MODE_FULL
systemChat ("fragCount cnt: " + str _totalFragCount);
TRACE_1("fragCount",_totalFragCount);
#endif
_totalFragCount
