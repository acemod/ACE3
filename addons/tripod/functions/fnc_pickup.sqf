/*
 * Author: Rocko, Ruthberg
 * Pick up tripod
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: tripod <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player, tripod] call ace_tripod_fnc_pickup
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit", "_tripod"];

if (stance _unit == "STAND") then {
    [_unit, "AmovPercMstpSrasWrflDnon_diary"] call EFUNC(common,doAnimation);
};

[{
    params ["_unit", "_tripod"];

    if (isNull _tripod) exitWith {};

    deleteVehicle _tripod;

    [_unit, "ACE_Tripod"] call EFUNC(common,addToInventory);
}, [_unit, _tripod], 1] call CBA_fnc_waitAndExecute;
