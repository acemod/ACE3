#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Function to update ACE Overheating's serverside spareBarrel database with new magIDs.
 *
 * Arguments:
 * 0: Old magIDs <ARRAY>
 * 1: New magIDs <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_old, _new] call ace_wardrobe_fnc_spareBarrelUpdateMagIDs
 *
 * Public: No
 */

if (!isServer) exitWith {};

params ["_oldMagIDs", "_newMagIDs"];

if (count _oldMagIDs != count _newMagIDs) exitWith { ERROR_2("Not Equal Number of magID's provided: %1 - %2",_oldMagIDs,_newMagIDs); };

private _map = EGVAR(overheating,storedSpareBarrels);

{
    private _oldID = _x;
    if !(_oldID in _map) then { continue };
    _map set [ _newMagIDs # _forEachIndex , _map deleteAt _oldID ];

} forEach _oldMagIDs;

nil
