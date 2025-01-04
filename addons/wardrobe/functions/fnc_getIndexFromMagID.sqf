#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * function to return the data index based of the magazine ID
 *
 * Arguments:
 * 0: magazine ID <STRING>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [_magID] call ace_wardrobe_fnc_getIndexFromMagID
 *
 * Public: Yes
 */

params [
    ["_magazineID", "", [""] ]
];

if !(_magazineID in allVariables ace_intelItems_intelMap) exitWith { -1 };

ace_intelItems_intelMap getVariable _magazineID
