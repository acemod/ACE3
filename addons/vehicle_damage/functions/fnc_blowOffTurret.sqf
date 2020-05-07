#include "script_component.hpp"
/*
 * Author: commy2
 * Blow off turret effect.
 *
 * Arguments:
 * 0: Vehicle <Object>
 *
 * Return Value:
 * None
 *
 * Example:
 * (vehicle player) call ace_vehicle_damage_fnc_blowOffTurret
 *
 * Public: No
 */

// delayed so the object is spawned after the model changes to a wreck
// the sudden change in the model would cause nearby physx objects to get stuck
[{
    params ["_vehicle"];

    private _config = _vehicle call CBA_fnc_getObjectConfig;
    getArray (_config >> QGVAR(turret)) params [["_model", "", [""]], ["_offset", [0,0,0], [[]], 3]];

    if (_model isEqualTo "") exitWith {};

    private _position = _vehicle modelToWorld _offset;
    private _turret = createVehicle [_model, _position, [], 0, "CAN_COLLIDE"];

    _turret setVectorUp [random 1, random 1, 1];
    _turret setVelocity [random 7, random 7, 8 + random 5];

    // add turret to all curators that already own the wreck
    [QGVAR(addTurretToEditable), [_vehicle, _turret]] call CBA_fnc_serverEvent;
}, _this, 1] call CBA_fnc_waitAndExecute;
