#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Wardrobe ExceptionHandling Function for ACE Items (Intel and Sparebarrels).
 *
 * Arguments:
 * 0: Magazine Classname <STRING>
 * 1: old Magazine IDs as Strings <ARRAY>
 * 2: new Magazine IDs as Strings <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_className, _oldMagIDs, _newMagIDs] call ace_wardrobe_fnc_exceptionsAceItems
 *
 * Public: No
 */

params ["_className", "_oldMagIDs", "_newMagIDs"];

if (count _oldMagIDs != count _newMagIDs) exitWith { ERROR_1("Not Equal Number of magID's provided: %1",_this) };

switch (_className) do {
    case "acex_intelitems_document";
    case "acex_intelitems_notepad";
    case "acex_intelitems_photo": {
        private _namespace = EGVAR(intelItems,intelMap);
        {
            private _oldMagID = _x;
            private _newMagID = _newMagIDs select _forEachIndex;

            private _intelID = _namespace getVariable [_oldMagID, -1];

            if (_intelID == -1) then { continue };

            _namespace setVariable [_newMagID, _intelID, true];
        } forEach _oldMagIDs;
    };

    case "ACE_SpareBarrel": {
        private _map = EGVAR(overheating,storedSpareBarrels);
        {
            private _oldID = _x;
            if !(_oldID in _map) then { continue };
            _map set [_newMagIDs # _forEachIndex , _map deleteAt _oldID];
        } forEach _oldMagIDs;
    };
};
