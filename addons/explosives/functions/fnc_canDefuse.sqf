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

scopeName "main";

if (_target isKindOf "ACE_DefuseObject") then {
    private _explosive = attachedTo _target;

    // Delete helper object attached to nothing
    if (isNull _explosive) exitWith {
        detach _target;
        deleteVehicle _target;

        false breakOut "main" // return
    };

    _target = _explosive;
};

(!GVAR(requireSpecialist) || {_unit call EFUNC(common,isEOD)}) &&
{mineActive _target || {!(_target isKindOf "UnderwaterMine_Range_Ammo")}} && // Handle naval mines (which don't get turned into items when defused)
{isNull objectParent _unit} &&
{GVAR(defusalKits) findAny (_unit call EFUNC(common,uniqueItems)) != -1} // return
