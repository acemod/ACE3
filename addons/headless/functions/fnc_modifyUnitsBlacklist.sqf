#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Modifies which units are blacklisted from being transferred to HCs.
 *
 * Arguments:
 * 0: Units <OBJECT, GROUP, ARRAY>
 * 1: Add (true) or remove (false) from blacklist <BOOL> (default: true)
 * 2: Transfer to server if blacklisted <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true] call ace_headless_fnc_modifyUnitsBlacklist
 *
 * Public: Yes
 */

params [["_units", objNull, [objNull, grpNull, []]], ["_blacklist", true, [false]], ["_transferToServer", true, [false]]];

if !(_units isEqualType []) then {
    _units = [_units];
};

_units = _units select {_x isEqualType objNull || {_x isEqualType grpNull}};
_units = _units select {!isNull _x};

if (_units isEqualTo []) exitWith {};

private _groups = [];

{
    _x setVariable [QXGVAR(blacklist), _blacklist, true];

    if (_blacklist && _transferToServer) then {
        if (_x isEqualType objNull) then {
            _groups pushBack _x;
        } else {
            _groups pushBack group _x
        };
    };
} forEach _units;

// Try to move AI back to server
if (_blacklist && _transferToServer) then {
    {
        _x setGroupOwner 2;
    } forEach (_groups arrayIntersect _groups);
};
