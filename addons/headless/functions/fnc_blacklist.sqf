#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Modifies which units are blacklisted from being transferred to HCs.
 *
 * Arguments:
 * 0: Units <OBJECT or GROUP or ARRAY>
 * 1: Add (true) or remove (false) from blacklist <BOOL> (default: true)
 * 2: Owner to transfer units to <NUMBER> (default: -1)
 * 3: Rebalance <NUMBER> (default: 0)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, true] call ace_headless_fnc_blacklist
 *
 * Public: Yes
 */

params [["_units", objNull, [objNull, grpNull, []]], ["_blacklist", true, [false]], ["_owner", -1, [0]], ["_rebalance", NO_REBALANCE, [0]]];

if !(_units isEqualType []) then {
    _units = [_units];
};

// Make sure passed arguments are objects or groups
_units = _units select {_x isEqualType objNull || {_x isEqualType grpNull}};
_units = _units select {!isNull _x};

if (_units isEqualTo []) exitWith {};

private _transfer = _blacklist && {_owner > 1};
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

// Try to move AI to new owner; Also takes care of rebalancing groups
if (_transfer || {_rebalance in [REBALANCE, FORCED_REBALANCE]}) then {
    [QGVAR(transferGroupsRebalance), [_groups arrayIntersect _groups, _owner, _rebalance]] call CBA_fnc_serverEvent;
};
