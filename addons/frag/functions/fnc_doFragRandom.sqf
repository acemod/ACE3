#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * This function creates fragments randomly spreading out from an explosion.
 * This function will spawn 5, 10, or 15 fragments.
 *
 * Arguments:
 * 0: Position (posAGL) of fragmenting projectile <ARRAY>
 * 1: Initial fragment velocity from Gurney equation <NUMBER>
 * 2: Velocity of the fragmenting projectile <ARRAY>
 * 3: Type of fragments to generate <ARRAY>
 * 4: Remaining fragment budget <NUMBER>
 * 5: Shot parents <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ASLtoAGL (getPosASL _projectile), 800, 50, 50, [], 1, [player, player]] call ace_frag_fnc_doFragRandom
 *
 * Public: No
 */

params ["_posAGL", "_fragVelocity", "_projectileVelocity", "_fragType", "_maxFragCount", "_shotParents"];
TRACE_6("doFragRandom",_posAGL,_fragVelocity,_projectileVelocity,_fragType,_maxFragCount,_shotParents);

// See CfgAmmoFragSpawner for different frag types
private _heightAGL = _posAGL#2;
private _hMode = switch (true) do {
    case (_heightAGL > 10): {"_top"};
    case (_heightAGL > 4): {"_high"};
    default {"_mid"};
};

private _type = [QGVAR(random_small_), QGVAR(random_tiny_)] select (_fragType isNotEqualTo [] && {"ace_frag_tiny" == (_fragType#0)});

_maxFragCount = switch (true) do {
    case (_maxFragCount <= 5): {"5"};
    case (_maxFragCount <= 10): {"10"};
    default {"15"};
};

// Spawn the fragment spawner
private _fragSpawner = createVehicle [_type + _maxFragCount + _hMode, _posAGL, [], 0, "CAN_COLLIDE"];
private _randDir = random 360;
_fragSpawner setVectorDirandUp [[0,0,-1], [cos _randDir, sin _randDir, 0]];
_fragSpawner setVelocity (_projectileVelocity vectorAdd [0, 0, -_fragVelocity]);
_fragSpawner setShotParents _shotParents;

TRACE_2("spawnedRandomFragmenter",typeOf _fragSpawner,getObjectID _fragSpawner);
#ifdef DEBUG_MODE_DRAW
_fragSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["","_subProj"];
        [_subProj, "green", true] call FUNC(dev_trackObj);
    }
];
if (GVAR(dbgSphere)) then {
    [AGLtoASL _posAGL] call FUNC(dev_sphereDraw);
};
#endif
