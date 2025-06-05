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
 * toFixed 0;
 * private _magazineDetails = (magazinesAmmoFull player) apply { [_x#0, _x#-2, _x#-1] } select { _x#0 == "acex_intelitems_document" };
 * { [_x#1, 69] call ace_wardrobe_fnc_setIndexForMagID } forEach _magazineDetails;
 *
 * Public: No
 */

params [["_magID", "", [""]], ["_index", 0, [0]]];

if (_index == -1) exitWith {};

EGVAR(intelItems,intelMap) setVariable [_magID, _index, true];
