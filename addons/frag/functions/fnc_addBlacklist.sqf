#include "..\script_component.hpp"
/*
 * Author: Jaynus, NouberNou, Lambda.Tiger
 * Adds a round to the blacklist (will be ignored) and removes any ace_frag event handlers added to it.
 * Once blacklisted a projectile can not be "unblacklisted."
 *
 * Arguments:
 * 0: Projectile to be blacklisted <OBJECT>
 *
 * Return Value:
 * Was the projectile blacklisted <BOOL>
 *
 * Example:
 * [_projectile] call ace_frag_fnc_addBlackList
 *
 * Public: Yes
 */

params [["_projectile", objNull, [objNull]]];
TRACE_2("addBlackList",_projectile,typeOf projectile);

if (isNull _projectile || {!isClass configOf _projectile}) exitWith {
    TRACE_1("Invalid projectile",_this);
    false
};

_projectile setVariable [QGVAR(blacklisted), true];
(_projectile getVariable [QGVAR(spallEH), [-1, -1]]) params ["_hitPartEH", "_penetratedEH"];
_projectile removeEventHandler ["HitPart", _hitPartEH];
_projectile removeEventHandler ["Penetrated", _penetratedEH];

true
