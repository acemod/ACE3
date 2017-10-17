#include "script_component.hpp"

// Rain
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(current_rain) = 0;
GVAR(rain_current_range) = -1+(random 2);
GVAR(rain_period_start_time) = CBA_missionTime;
GVAR(ACE_rain) = rain;

// Wind
call FUNC(initWind);

["ace_settingsInitialized", {
    TRACE_3("ace_settingsInitialized eh",GVAR(enableServerController),GVAR(serverUpdateInterval),GVAR(useACEWeather));

    if (GVAR(enableServerController)) then {
        [FUNC(serverController), GVAR(serverUpdateInterval)] call CBA_fnc_addPerFrameHandler;
    };

    if (GVAR(useACEWeather)) then {
        GVAR(nextUpdateRain) = 0;

        addMissionEventHandler ["EachFrame", {
            if (CBA_missionTime >= GVAR(nextUpdateRain)) then {
                [] call FUNC(updateRain); // Every 2 seconds
                GVAR(nextUpdateRain) = 2 + CBA_missionTime;
            };
            0 setRain GVAR(ACE_rain); // Update rain every frame
        }];
    };
}] call CBA_fnc_addEventHandler;
