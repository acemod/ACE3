#include "script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether a unit can perform the defuse action
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 0: Target (ACE_DefuseObject) <OBJECT>
 *
 * Return Value:
 * Able to defuse <BOOL>
 *
 * Example:
 * if ([player] call ACE_Explosives_fnc_canDefuse) then {hint "Can Defuse";};
 *
 * Public: Yes
 */

params ["_unit", "_target"];
TRACE_2("params",_unit,_target);

private _explosive = _target getVariable [QGVAR(Explosive), objNull];
if (isNull _explosive) exitWith {
    deleteVehicle _target;
    false
};
if (vehicle _unit != _unit || {!("ACE_DefusalKit" in (_unit call EFUNC(common,uniqueItems)))}) exitWith {false};

if (GVAR(RequireSpecialist) && {!([_unit] call EFUNC(Common,isEOD))}) exitWith {false};

//Handle the naval mines (which doens't get turned into items when defused):
if ((_explosive isKindOf "UnderwaterMine_Range_Ammo") && {!mineActive _explosive}) exitWith {false};

true
