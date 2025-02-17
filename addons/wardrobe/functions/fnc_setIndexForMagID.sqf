#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Sets the data-index for a magID
 *
 * Arguments:
 * 0: Magazine ID <STRING>
 * 1: Index <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_magID, _index] call ace_wardrobe_fnc_setIndexForMagID
 *
 * Public: No
 */

params [
    ["_magID", "", [""]],
    ["_index", 0, [0]]
];

if (_index == -1) exitWith {};

EGVAR(intelItems,intelMap) setVariable [_magID, _index, true];
