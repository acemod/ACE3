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

params [["_args", [objNull, "", objNull], [[]], 3]];
_args params ["_unit", "_magazineClass", "_truck"];
TRACE_3("takeSuccess",_unit,_magazineClass,_truck);

private _success = true;
if (GVAR(supply) > 0) then {
    _success = [_truck, _magazineClass] call FUNC(removeMagazineFromSupply);
};
if !(_success) exitWith {WARNING_2("takeSuccess failed to take [%1] from [%2]",_magazineClass,_truck);};

[_unit, "forceWalk", QGVAR(vehRearm), true] call EFUNC(common,statusEffect_set);
private _dummy = [_unit, _magazineClass] call FUNC(createDummy);
[_dummy, _unit] call FUNC(pickUpAmmo);

private _actionID = _unit addAction [
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
