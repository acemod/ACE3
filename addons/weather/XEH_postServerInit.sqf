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
    TRACE_2("ace_settingsInitialized eh",GVAR(enableServerController),GVAR(serverUpdateInterval));

    if (GVAR(enableServerController)) then {
        [FUNC(serverController), GVAR(serverUpdateInterval)] call CBA_fnc_addPerFrameHandler;
    };

    if (GVAR(useACEWeather)) then {
        // Update rain every frame
        addMissionEventHandler ["EachFrame", {0 setRain GVAR(ACE_rain)}];

        // Create a 1 sec delay PFEH to update rain
        [{
            BEGIN_COUNTER(weatherPFEHserver);

            GVAR(nextUpdateRain) = 0;
            if (CBA_missionTime >= GVAR(nextUpdateRain)) then {
                [] call FUNC(updateRain); // Every 2 seconds
                GVAR(nextUpdateRain) = 2 + CBA_missionTime;
            };

            END_COUNTER(weatherPFEHserver);
        }, 1, []] call CBA_fnc_addPerFrameHandler;
    };
}] call CBA_fnc_addEventHandler;
