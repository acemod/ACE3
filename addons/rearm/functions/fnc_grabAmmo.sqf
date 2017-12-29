/*
 * Author: GitHawk
 * Grabs an dummy ammo.
 *
 * Arguments:
 * 0: Ammo Dummy <OBJECT>
 * 1: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [dummy, player] call ace_rearm_fnc_grabAmmo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_dummy", "_unit"];

REARM_HOLSTER_WEAPON;
[_unit, "forceWalk", "ACE_rearm", true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", "ACE_rearm", true] call EFUNC(common,statusEffect_set);

[
    TIME_PROGRESSBAR(5),
    [_dummy, _unit],
    {
        params ["_args"];
        _args params ["_dummy", "_unit"];
        [_dummy, _unit] call FUNC(pickUpAmmo);

        private _actionID = _unit getVariable [QGVAR(ReleaseActionID), -1];
        if (_actionID != -1) then {
            _unit removeAction _actionID;
        };
        _actionID = _unit addAction [
            format ["<t color='#FF0000'>%1</t>", localize ELSTRING(dragging,Drop)],
            '(_this select 0) call FUNC(dropAmmo)',
            nil,
            20,
            false,
            true,
            "",
            '!isNull (_target getVariable [QGVAR(dummy), objNull])'
        ];
        _unit setVariable [QGVAR(ReleaseActionID), _actionID];
    },
    "",
    localize LSTRING(GrabAction),
    {true},
    ["isnotinside"]
] call EFUNC(common,progressBar);
