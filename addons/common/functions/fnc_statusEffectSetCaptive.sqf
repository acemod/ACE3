#define DEBUG_MODE_FULL

#include "script_component.hpp"

PARAMS_2(_unit,_isEnabled);
DEFAULT_PARAM(2,_isGlobal, false);

if (!_isGlobal) exitWith {
  ["setCaptive", [_unit, _isEnabled, true]] call FUNC(globalEvent);
} else {
  _unit setCaptive _isEnabled;
};