#include "script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function creates fragments randomly spreading out from an explosion to
 * a maximum of 15
 * 
 * Arguments:
 * 0: Position of fragmenting projectile ASL <ARRAY>
 * 1: Velocity of the fragmenting projectile <ARRAY>
 * 2: Height (AGL) of the fragmenting projectile <SCALAR>
 * 3: Type of fragments to generate
 * 4: Remaining fragment budget <SCALAR>
 * 5: Shot parent <ARRAY>
 * 
 * Return Value:
 * None
 *
 * Example:
 * [getPosASL _proj, velocity _proj, 50, 50, [], 1, [player, player]] call ace_frag_fnc_doFragRandom;
 *
 * Public: No
 */

params [
    "_posASL", 
    ["_projVel", [0,0,0]],  
    ["_heightAGL", 2, [123]],
    ["_fragType", [], [[]]], 
    ["_fragCnt", 10, [123]],
    ["_shotPrnt", [objNull, objNull], [[]], [2]]
];
TRACE_5("fnc_doFragRandom", _posASL, _projVel, _heightAGL, _fragType, _fragCnt);

// See CfgAmmo for different frag types
private _hMode = switch (true) do {
    case (_heightAGL > 10): {"_top"};
    case (_heightAGL > 5): {"_hi"};
    default {"_mid"};
};

// Select the cfgAmmo type 
private _type = if (count _fragType > 0 && 
    				{"ace_frag_tiny" isEqualTo (_fragType#0)}) then {
    QGVAR(def_tiny_)
} else {
    QGVAR(def_small_)
};

_fragCnt = switch (true) do {
    case (_fragCnt <= 5): {"5"};
    case (_fragCnt <= 10): {"10"};
    default {"15"};
};

// Spawn the fragment spawner
private _fragSpawner = createVehicle [_type + _fragCnt + _hMode, ASLToATL _posASL, [], 0, "CAN_COLLIDE"];
_fragSpawner setVectorDirandUp [[0,0,1], [1,0,0]];
_fragSpawner setVelocity _projVel;
_fragSpawner setShotParents _shotParents;

#ifdef DEBUG_MODE_FULL
    systemChat ("fragging, id: " + getObjectID _proj);
    _fragSpawner addEventHandler [
        "SubmunitionCreated",
        {
            params ["","_subProj"];
            [_subProj, "green", true] call FUNC(dev_trackObj);
        }
    ];
    [_posASL] call FUNC(dev_sphereDraw);
#endif 