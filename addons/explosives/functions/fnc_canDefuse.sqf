#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet
 * Whether a unit can perform the defuse action.
 *
 * Arguments:
 * 0: Unit <OBJECT> (default: objNull)
 * 1: Interaction object or target explosive <OBJECT> (default: objNull)
 *
 * Return Value:
 * Able to defuse <BOOL>
 *
 * Example:
 * [player, cursorObject] call ace_explosives_fnc_canDefuse
 *
 * Public: Yes
 */

params [["_unit", objNull, [objNull]], ["_target", objNull, [objNull]]];
TRACE_2("params",_unit,_target);

if (!alive _unit || {!alive _target}) exitWith {
    false // return
};

private _explosive = _target;

if (_target isKindOf "ACE_DefuseObject") then {
    _explosive = attachedTo _target;
};

if (isNull _explosive) exitWith {
    detach _target;
    deleteVehicle _target;

    false // return
};

(!GVAR(requireSpecialist) || {_unit call EFUNC(common,isEOD)}) &&
{isNull objectParent _unit && {GVAR(defusalKits) findAny (_unit call EFUNC(common,uniqueItems)) != -1}} &&
{mineActive _explosive || {!(_explosive isKindOf "UnderwaterMine_Range_Ammo")}} // Handle naval mines (which don't get turned into items when defused)
