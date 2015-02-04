/*
 * Author: commy2
 * Handles when a captive unit gets out of a vehicle.
 *
 * Arguments:
 * 0: _vehicle <OBJECT>
 * 2: dunno <OBJECT>
 * 1: _unit <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * -
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_vehicle,_dontcare,_unit);

if ((local _unit)&&(_unit getVariable ["ACE_isCaptive", false])) then {

    private ["_cargoIndex"];

    _cargoIndex = _unit getVariable ["ACE_Captives_CargoIndex", -1];

    //If captive was not "unloaded", then move them back into the vehicle.
    if (_cargoIndex != -1) exitWith {
        _unit moveInCargo [_vehicle, _cargoIndex];
    };

    [_unit, "ACE_AmovPercMstpScapWnonDnon", 2] call EFUNC(common,doAnimation);
};