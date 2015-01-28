#include "script_component.hpp"
PARAMS_1(_unit);

("ACE_wirecutter" in (items _unit)) && {!(isNull ([_unit] call FUNC(getNearestFence)))}
