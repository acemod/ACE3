#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Gets the delay duration an item should take to load/unload.
 *
 * Arguments:
 * 0: Item <OBJECT>
 *
 * Return Value:
 * Item load/unload duration <NUMBER>
 *
 * Example:
 * cursorObject call ace_cargo_fnc_getDelayItem
 *
 * Public: Yes
 */

params ["_item"];

if (_item getVariable [QGVAR(delay), -1] >= 0) exitWith {
    _item getVariable QGVAR(delay)  // return
};
GVAR(loadTimeCoefficient) * (_item call FUNC(getSizeItem))  // return

