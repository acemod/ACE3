#include "script_component.hpp"

// Temperature, pressure, humidity randomization
missionNamespace setVariable [QGVAR(temperatureShift), 3 - random 6, true];
missionNamespace setVariable [QGVAR(badWeatherShift), (random 1) ^ 2 * 10, true];
missionNamespace setVariable [QGVAR(humidityShift), (5 - random 10) / 100, true];

// Rain
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(next_rain) = 0;
GVAR(last_rain) = 0;
GVAR(current_rain) = rain;
GVAR(rain_current_range) = -1+(random 2);
GVAR(rain_transition_time) = 0;

// Wind
call FUNC(initWind);

["ace_settingsInitialized", {
    TRACE_2("ace_settingsInitialized eh",GVAR(updateInterval),GVAR(enabled));
    
    [FUNC(updateServerWeather), GVAR(updateInterval)] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
