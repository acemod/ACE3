#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Wardrobe Exception Handling Function for ACE Intel Items.
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
 * [_className, _oldMagIDs, _newMagIDs] call ace_wardrobe_fnc_exceptionAceIntel
 *
 * Public: No
 */

params ["_className", "_oldMagIDs", "_newMagIDs"];

if (count _oldMagIDs != count _newMagIDs) exitWith { ERROR_1("Not Equal Number of magID's provided: %1",_this) };

private _namespace = EGVAR(intelItems,intelMap);
{
    private _oldMagID = _x;
    private _newMagID = _newMagIDs select _forEachIndex;

    private _intelID = _namespace getVariable [_oldMagID, -1];

    if (_intelID == -1) then { continue };

    _namespace setVariable [_newMagID, _intelID, true];
} forEach _oldMagIDs;
