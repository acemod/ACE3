/*
 * Author: Glowbal, SilentSpike
 * Get the cargo size of an object.
 *
 * Arguments:
 * 0: Item <OBJECT or STRING>
 *
 * Return Value:
 * Cargo size <NUMBER> (default: -1)
 *
 * Example:
 * [object] call ace_cargo_fnc_getSizeItem
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_item"];

// Virtual items are much easier to deal with
if (_item isEqualType "") then {
    CARGO_SIZE(_item)
} else {
    if (isNil {_item getVariable QGVAR(size)}) then {
        CARGO_SIZE(typeOf _item)
    } else {
        _item getVariable QGVAR(size)
    };
};
