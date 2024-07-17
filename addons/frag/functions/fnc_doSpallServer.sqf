#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger,
 * This function creates the requested spalling submunition spawner at a speed and direction.
 * The function is intended to create the spalling on a server via an event call by
 * ace_frag_fnc_doSpallLocal. The "local" version determines whether an event has occured
 * and triggers this event if it has.
 *
 * Arguments:
 * 0: Class name of the spall spawner <STRING>
 * 1: Normalized 3D vector direction of the spall spawner <ARRAY>
 * 2: "Up" vector for the projectile, required for the spawner to aim out of the 2D plane <ARRAY>
 * 3: The change in velocity that spalling projectile experienced <NUMBER>
 * 4: Shot parents array for the projectile that creates spall <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [QGVAR(rock_spall_tiny), [1,0,0], [0,0,1], 300, [objNull, ace_player]] call ace_frag_fnc_doSpallServer
 *
 * Public: No
 */
params ["_spallSpawnerName", "_lastVelocityNorm", "_vectorUp", "_speedChange", "_shotParents"];

private _spallSpawner = createVehicle [
    _spallSpawnerName,
    ASLToATL _spallPosASL,
    [],
    0,
    "CAN_COLLIDE"
];
_spallSpawner setVectorDirandUp [_lastVelocityNorm, _vectorUp];
_spallSpawner setVelocityModelSpace [0, _speedChange * ACE_FRAG_SPALL_VELOCITY_INHERIT_COEFF, 0];
_spallSpawner setShotParents _shotParents;

#ifdef DEBUG_MODE_DRAW
_spallSpawner addEventHandler [
    "SubmunitionCreated",
    {
        params ["", "_submunitionProjectile"];
        _submunitionProjectile call FUNC(dev_addRound);
    }
];
#endif
