/*
 * Author: GitHawk
 * Drops a magazine, optionally deletes it and optionally unholsters the wepaon.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Delete dummy object <BOOL>(optional)
 * 2: Unholster Weapon <BOOL>(optional)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, true, true] call ace_rearm_fnc_dropAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params [
    ["_unit", objNull, [objNull]],
    ["_delete", false, [false]],
    ["_unholster", true, [true]]
];

private _dummy = _unit getVariable [QGVAR(dummy), objNull];
if !(isNull _dummy) then {
    detach _dummy;
    if (_delete) then {
        deleteVehicle _dummy;
    } else {
        _dummy setVelocity [0,0,-0.1];
    };
    _unit setVariable [QGVAR(dummy), objNull];
};
private _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
if (_actionID != -1) then {
    _unit removeAction _actionID;
    _unit setVariable [QGVAR(ReleaseActionID), nil];
};
[_unit, "forceWalk", QGVAR(vehRearm), false] call EFUNC(common,statusEffect_set);

if (_unholster) then {
    REARM_UNHOLSTER_WEAPON
};
