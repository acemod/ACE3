#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Gets the delay duration an item should take to load/unload.
 *
 * Arguments:
 * 0: Item <STRING or OBJECT>
 * 1: If delay is for paradrop context <BOOL>
 *
 * Return Value:
 * Item load/unload duration <NUMBER>
 *
 * Example:
 * [cursorObject, false] call ace_cargo_fnc_getDelayItem
 *
 * Public: No
 */

params ["_item", "_isParadrop"];

if ((_item isEqualType objNull) && {_item getVariable [QGVAR(delay), -1] >= 0}) exitWith {
    _item getVariable QGVAR(delay) // return
};

([GVAR(loadTimeCoefficient), GVAR(paradropTimeCoefficent)] select _isParadrop) * (_item call FUNC(getSizeItem)) // return
