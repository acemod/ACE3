#include "script_component.hpp"
/*
 * Author: commy2
 * Initialize variables for drag or carryable objects. Called from init EH.
 *
 * Arguments:
 * 0: Any object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [box] call ace_dragging_fnc_initObject;
 *
 * Public: No
 */

params ["_object"];

private _config = configFile >> "CfgVehicles" >> typeOf _object;

if (getNumber (_config >> QGVAR(canDrag)) == 1) then {
    private _position = getArray (_config >> QGVAR(dragPosition));
    private _direction = getNumber (_config >> QGVAR(dragDirection));

    [_object, true, _position, _direction] call FUNC(setDraggable);
};

if (getNumber (_config >> QGVAR(canCarry)) == 1) then {
    private _position = getArray (_config >> QGVAR(carryPosition));
    private _direction = getNumber (_config >> QGVAR(carryDirection));

    [_object, true, _position, _direction] call FUNC(setCarryable);
};
