#include "script_component.hpp"
/*
 * Author: Brandon (TCVM)
 * Takes a plug from the launch suitcase
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Suitcase <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, player] call ace_malyutka_fnc_takePlug
 *
 * Public: No
 */
params ["_unit", "_target"];

private _handle = createVehicle [QGVAR(plug), [0, 0, 0], [], 0, "CAN_COLLIDE"];
_handle setVariable [QGVAR(origin), _target, true];
_handle setVariable [QGVAR(attachedControlBox), objNull, true];
_handle setVariable [QGVAR(dropped), false, false];
[_unit, _handle] call FUNC(pickupPlug);

private _rope = ropeCreate [_target, "missile_plug", _handle, [0, 0, 0], MAX_WIRE_DISTANCE];

_target setVariable [QGVAR(plugTaken), true, true];
_target setVariable [QGVAR(plugRope), _rope, true];
_target setVariable [QGVAR(plugHeader), _handle, true];


