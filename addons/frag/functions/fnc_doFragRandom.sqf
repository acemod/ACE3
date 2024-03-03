#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function creates fragments randomly spreading out from an explosion.
 * This function will spawn 5, 10, or 15 fragments depending on the
 *
 * Arguments:
 * 0: Position (posASL) of fragmenting projectile <ARRAY>
 * 1: Velocity of the fragmenting projectile <ARRAY>
 * 2: Height (AGL) of the fragmenting projectile <NUMBER>
 * 3: Type of fragments to generate <ARRAY>
 * 4: Remaining fragment budget <NUMBER>
 * 5: Shot parents <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosASL _proj, 800, 50, 50, [], 1, [player, player]] call ace_frag_fnc_doFragRandom;
 *
 * Public: No
 */

params ["_posASL", "_fragVelocity", "_heightATL", "_fragType", "_maxFragCount", "_shotParents"];
TRACE_6("doFragRandom",_posASL,_fragVelocity,_heightATL,_fragType,_maxFragCount,_shotParents);

// See CfgAmmoFragSpawner for different frag types
private _hMode = switch (true) do {
    case (_heightATL > 10): {"_top"};
    case (_heightATL > 5): {"_hi"};
    default {"_mid"};
};

private _type = [QGVAR(def_small_), QGVAR(def_tiny_)] select (_fragType isNotEqualTo [] && {"ace_frag_tiny" isEqualTo (_fragType#0)});

_maxFragCount = switch (true) do {
    case (_maxFragCount <= 5): {"5"};
    case (_maxFragCount <= 10): {"10"};
    default {"15"};
};

// Spawn the fragment spawner
private _fragSpawner = createVehicle [_type + _maxFragCount + _hMode, ASLToATL _posASL, [], 0, "CAN_COLLIDE"];
_fragSpawner setVectorDirandUp [[0,0,1], [1,0,0]];
_fragSpawner setVelocity _fragVelocity;
_fragSpawner setShotParents _shotParents;

#ifdef DEBUG_MODE_FULL
systemChat ("fragging, id: " + getObjectID _proj);
#endif
#ifdef DEBUG_MODE_DRAW
_fragSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["","_subProj"];
        [_subProj, "green", true] call FUNC(dev_trackObj);
    }
];
if (GVAR(dbgSphere)) then {
    [_posASL] call FUNC(dev_sphereDraw);
};
#endif
