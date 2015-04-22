#include "script_component.hpp"

// Randomization
GVAR(temperatureShift) = 3 - random 6;
GVAR(badWeatherShift) = (random 1) ^ 2 * 10;
GVAR(humidityShift) = (5 - random 10) / 100;

// Rain
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(current_rain) = 0;
GVAR(rain_current_range) = -1+(random 2);

// Wind
call FUNC(initWind);

GVAR(overcast_multiplier) = 1;
GVAR(serverUpdateInterval) = 60;

[FUNC(serverController), GVAR(serverUpdateInterval)] call cba_fnc_addPerFrameHandler;
