/*
 * Author: commy2
 *
 * Initialize variables for drag or carryable objects. Called from init EH.
 *
 * Argument:
 * 0: Any object (Object)
 *
 * Return value:
 * NONE.
 */
#include "script_component.hpp"

private "_object";

_object = _this select 0;

private "_config";
_config = configFile >> "CfgVehicles" >> typeOf _object;

if (getNumber (_config >> QGVAR(canDrag)) == 1) then {
    private ["_position", "_direction"];

    _position = getArray (_config >> QGVAR(dragPosition));
    _direction = getNumber (_config >> QGVAR(dragDirection));

    [_object, true, _position, _direction] call FUNC(setDraggable);
};

if (getNumber (_config >> QGVAR(canCarry)) == 1) then {
    private ["_position", "_direction"];

    _position = getArray (_config >> QGVAR(carryPosition));
    _direction = getNumber (_config >> QGVAR(carryDirection));

    [_object, true, _position, _direction] call FUNC(setCarryable);
};
