/*
 * Author: Rocko, Ruthberg
 *
 * Pick up spotting scope
 *
 * Arguments:
 * 0: spotting scope <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

PARAMS_2(_spottingScope,_unit);

if ((_unit call CBA_fnc_getUnitAnim) select 0 == "stand") then {
	_unit playMove "AmovPercMstpSrasWrflDnon_diary";
};

[{
    PARAMS_2(_spottingScope,_unit);
    
    _unit addItem "ACE_SpottingScope";
    deleteVehicle _spottingScope;
    
}, [_spottingScope, _unit], 1, 0]call EFUNC(common,waitAndExecute);
