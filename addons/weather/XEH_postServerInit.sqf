#include "script_component.hpp"

// Rain
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(current_rain) = 0;
GVAR(rain_current_range) = -1+(random 2);

// Wind
call FUNC(initWind);

[FUNC(serverController), GVAR(serverUpdateInterval)] call cba_fnc_addPerFrameHandler;
