//#define DEBUG_MODE_FULL
#include "script_component.hpp"

private["_stake", "_class"];
//TRACE_1("", _this);

PARAMS_1(_stake);

_class = typeOf _stake;

// deleteVehicle _stake;

[_stake] call FUNC(onPlaceStake);
