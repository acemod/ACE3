#include "script_component.hpp"
/*
 * Author: GitHawk
 * Takes a magazine from an ammo truck.
 *
 * Arguments:
 * 0: Params <ARRAY>
 *   0: Unit <OBJECT>
 *   1: Magazine Classname <STRING>
 *   2: Ammo Truck <OBJECT>
 *   3: Target Vehicle or Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, "500Rnd_127x99_mag_Tracer_Red", ammoTruck, targetVehicle]] call ace_rearm_fnc_takeSuccess
 *
 * Public: No
 */

params ["_args"];
_args params ["_unit", "_magazineClass", "_truck", "_vehicle"];
TRACE_4("takeSuccess",_unit,_magazineClass,_truck,_vehicle);

private _success = true;
if (GVAR(supply) > 0) then {
    _success = [_truck, _magazineClass] call FUNC(removeMagazineFromSupply);
};
if !(_success) exitWith {WARNING_2("takeSuccess failed to take [%1] from [%2]",_magazineClass,_truck);};

if (_vehicle == _unit) exitWith {
    ([_magazineClass] call FUNC(getCaliber)) params ["", "_idx"];
    private _rounds = (REARM_COUNT select _idx);
    TRACE_4("passing to csw",_unit,_magazineClass,_idx,_rounds);
    [_unit, _magazineClass, _rounds] call EFUNC(csw,reload_handleReturnAmmo);
};

[_unit, "forceWalk", "ACE_rearm", true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", "ACE_rearm", true] call EFUNC(common,statusEffect_set);
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
