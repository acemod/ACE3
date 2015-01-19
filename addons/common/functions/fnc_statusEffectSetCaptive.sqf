/*
Name: statusEffectSetCaptive

Author: Pabst Mirror

Description:
  Handles the "setCaptive" event

Parameters:
  0: OBJECT - Unit
  1: BOOL - Enabled

Returns:
  None
*/

#define DEBUG_MODE_FULL

#include "script_component.hpp"

PARAMS_2(_unit,_isEnabled);

if (!local _unit) then {
  WARNING("statusEffectSetCaptive with non local unit");
  ["setCaptive", _unit, [_unit, _isEnabled]] call FUNC(targetEvent);
} else {
  _unit setCaptive _isEnabled;
};
