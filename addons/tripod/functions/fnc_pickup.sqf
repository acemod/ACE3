/*
 * Author: Rocko, Ruthberg
 *
 * Pick up tripod
 *
 * Arguments:
 * 0: tripod <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_tripod,_unit);

if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
    _unit playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
    PARAMS_2(_tripod,_unit);

    [_unit, "ACE_Tripod"] call EFUNC(common,addToInventory);
    deleteVehicle _tripod;

}, [_tripod, _unit], 1, 0]call EFUNC(common,waitAndExecute);
