#include "script_component.hpp"

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    GVAR(temperatureShift) = random [-SD_TO_MIN_MAX(4), 0, SD_TO_MIN_MAX(4)]; // Gauss(0, 4)
    GVAR(badWeatherShift)  = random [-SD_TO_MIN_MAX(2) + 4, 4, 4 + SD_TO_MIN_MAX(2)]; // Gauss(4, 2)
    GVAR(humidityShift)    = random [-SD_TO_MIN_MAX(0.065), 0, SD_TO_MIN_MAX(0.065)]; // Gauss(0, 0.065)

    if (GVAR(windSimulation)) then {
        call FUNC(initWind);
        [FUNC(updateWind), 1] call CBA_fnc_addPerFrameHandler;
    };
    [FUNC(updateWeather), GVAR(updateInterval)] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_addEventHandler;
