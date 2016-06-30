/*
 * Author: Rocko, Ruthberg
 * Pick up spotting scope
 *
 * Arguments:
 * 0: spotting scope <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [spotting_scope, player] call ace_spottingscope_fnc_pickup
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_spottingScope", "_unit"];

if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    _unit playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
    params ["_spottingScope", "_unit"];

    [_unit, "ACE_SpottingScope"] call EFUNC(common,addToInventory);
    deleteVehicle _spottingScope;
}, [_spottingScope, _unit], 1, 0]call CBA_fnc_waitAndExecute;
