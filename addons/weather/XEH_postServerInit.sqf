#include "script_component.hpp"

// Rain
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(current_rain) = 0;
GVAR(rain_current_range) = -1+(random 2);

// Wind
call FUNC(initWind);

["ace_settingsInitialized", {
    TRACE_2("ace_settingsInitialized eh",GVAR(enableServerController),GVAR(serverUpdateInterval));

    if (GVAR(enableServerController)) then {
        [FUNC(serverController), GVAR(serverUpdateInterval)] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
