#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Wardrobe ExceptionHandling Function for ACE Sparebarrels.
 *
 * Arguments:
 * 0: Magazine Classname <STRING>
 * 1: Old Magazine IDs as Strings <ARRAY>
 * 2: New Magazine IDs as Strings <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_className, _oldMagIDs, _newMagIDs] call ace_wardrobe_fnc_exceptionAceSpareBarrel
 *
 * Public: No
 */

params ["_className", "_oldMagIDs", "_newMagIDs"];

if (count _oldMagIDs != count _newMagIDs) exitWith { ERROR_1("Not Equal Number of magID's provided: %1",_this) };

private _map = EGVAR(overheating,storedSpareBarrels);
{
    private _oldID = _x;
    if !(_oldID in _map) then { continue };
    _map set [_newMagIDs # _forEachIndex , _map deleteAt _oldID];
} forEach _oldMagIDs;
