/*
 * Author: GitHawk
 * Takes a magazine from an ammo truck.
 *
 * Arguments:
 * 0: Params <ARRAY>
 *   0: Unit <OBJECT>
 *   1: Magazine Classname <STRING>
 *   2: Ammo Truck <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, "500Rnd_127x99_mag_Tracer_Red"]] call ace_rearm_fnc_takeSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_ammo", "_dummyName", "_dummy", "_actionID"];
params ["_args"];
_args params ["_unit", "_magazineClass", "_target"]; // _target is for future possible finite ammo

[_unit, QGVAR(vehRearm), true] call EFUNC(common,setForceWalkStatus);
_dummy = [_unit, _magazineClass] call FUNC(createDummy);
[_dummy, _unit] call FUNC(pickUpAmmo);

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
