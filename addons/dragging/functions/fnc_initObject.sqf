#include "..\script_component.hpp"
/*
 * Author: commy2
 * Initializes variables for draggable / carryable objects. Called from init EH.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorTarget] call ace_dragging_fnc_initObject;
 *
 * Public: No
 */

params ["_object"];

private _config = configOf _object;

if (getNumber (_config >> QGVAR(canDrag)) == 1) then {
    private _position = [_config >> QGVAR(dragPosition), "ARRAY", [0, 1.5, 0]] call CBA_fnc_getConfigEntry;
    private _direction = getNumber (_config >> QGVAR(dragDirection));
    private _ignoreWeight = getNumber (_config >> QGVAR(ignoreWeight));

    [_object, true, _position, _direction, _ignoreWeight > 0] call FUNC(setDraggable);
};

if (getNumber (_config >> QGVAR(canCarry)) == 1) then {
    private _position = [_config >> QGVAR(carryPosition), "ARRAY", [0, 1, 1]] call CBA_fnc_getConfigEntry;
    private _direction = getNumber (_config >> QGVAR(carryDirection));
    private _ignoreWeight = getNumber (_config >> QGVAR(ignoreWeightCarry));

    [_object, true, _position, _direction, _ignoreWeight > 0] call FUNC(setCarryable);
};
