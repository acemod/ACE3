//XEH_collimator_init.sqf
#include "script_component.hpp"

PARAMS_1(_collimator);

_adjustCollimator = _collimator addAction [localize "STR_ACE_ARTY_ADJUST_COLLIMATOR", "fnc_adjustCollimator.sqf", [], -100, false, true, "", "alive _target"];
