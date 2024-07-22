#include "..\script_component.hpp"
/*
 * Author: Rocko, Ruthberg
 *
 * Dismounts the concertina wire
 *
 * Arguments:
 * 0: wire <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [wire] call ace_concertina_wire_fnc_dismountSuccess
 *
 * Public: No
 */

params ["_wire"];

{
    _wire animate [_x, 1];
} forEach WIRE_FAST;

[{
    params ["_args", "_idPFH"];
    _args params ["_wire"];

    if (_wire animationPhase "wire_2" == 1) then {

        private _dir = getDir _wire;
        private _pos = getPosASL _wire;

        private _wirecoil = "ACE_ConcertinaWireCoil" createvehicle [0, 0, 0];

        deleteVehicle _wire;

        _wirecoil setDir _dir;
        _wirecoil setPosASL _pos;
        _wirecoil setVelocity [0, 0, 0];

        [_idPFH] call CBA_fnc_removePerFrameHandler;
    };
}, 0, [_wire]] call CBA_fnc_addPerFrameHandler;
