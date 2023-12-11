#include "..\script_component.hpp"
/*
 * Author: Glowbal, kymckay
 * Gets the cargo size of an object.
 *
 * Arguments:
 * 0: Item <STRING> or <OBJECT>
 *
 * Return Value:
 * Cargo size <NUMBER> (default: -1)
 *
 * Example:
 * cursorObject call ace_cargo_fnc_getSizeItem
 *
 * Public: No
 */

params ["_item"];

// Default cargo size is -1 as 0 is a valid size
if (_item isEqualType "") then {
    GET_NUMBER(configFile >> "CfgVehicles" >> _item >> QGVAR(size),-1)
} else {
    _item getVariable [QGVAR(size), GET_NUMBER(configOf _item >> QGVAR(size),-1)]
};
