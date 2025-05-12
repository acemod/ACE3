#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Function to update ACE Overheating's Serverside SpareBarrel DataBase with new MagIDs.
 *
 * Arguments:
 * 0: old magIDs <ARRAY>
 * 1: new magIDs <ARRAY>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [_old, _new] call ace_wardrobe_fnc_spareBarrel_updateMagIDs
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_old_magIDs", "_new_magIDs"];

if (count _old_magIDs != count _new_magIDs) exitWith { ERROR_2("Not Equal Number of magID's provided: %1 - %2",_old_magIDs,_new_magIDs); systemChat "Errorrrrrrrrrrr"; };

private _map = EGVAR(overheating,storedSpareBarrels);

{
    private _oldID = _x;
    if !(_oldID in _map) then { continue };
    _map set [ _new_magIDs # _forEachIndex , _map deleteAt _oldID ];

} forEach _old_magIDs;