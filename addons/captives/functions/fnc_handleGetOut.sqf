/*
 * Author: commy2
 * X
 *
 * Arguments:
 * 0: _vehicle <OBJECT>
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

PARAMS_2(_vehicle,_unit);

private ["_cargoIndex"];

_cargoIndex = _unit getVariable ["ACE_Captives_CargoIndex", -1];

if (_cargoIndex != -1) exitWith {
  _unit moveInCargo [_vehicle, _cargoIndex];
};

[_unit, 'ACE_AmovPercMstpScapWnonDnon', 2] call EFUNC(common,doAnimation);
