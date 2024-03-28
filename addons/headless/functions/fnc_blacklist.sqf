#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Modifies which units are blacklisted from being transferred to HCs.
 *
 * Arguments:
 * 0: Units <OBJECT, GROUP, ARRAY>
 * 1: Add (true) or remove (false) from blacklist <BOOL> (default: true)
 * 2: Owner to transfer units to <NUMBER> (default: -1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true] call ace_headless_fnc_blacklist
 *
 * Public: Yes
 */

params [["_units", objNull, [objNull, grpNull, []]], ["_blacklist", true, [false]], ["_newOwner", -1, [false]]];

if !(_units isEqualType []) then {
    _units = [_units];
};

// Make sure passed arguments are objects or groups
_units = _units select {_x isEqualType objNull || {_x isEqualType grpNull}};
_units = _units select {!isNull _x};

if (_units isEqualTo []) exitWith {};

private _transfer = _blacklist && {_newOwner > 1};
private _groups = [];

{
    _x setVariable [QXGVAR(blacklist), _blacklist, true];

    if (_transfer) then {
        if (_x isEqualType objNull) then {
            _groups pushBack group _x;
        } else {
            _groups pushBack _x;
        };
    };
} forEach _units;

// Try to move AI back to server
if (_transfer) then {
    [QGVAR(transferGroupsToOwner), [_groups arrayIntersect _groups, _newOwner]] call CBA_fnc_serverEvent;
};
