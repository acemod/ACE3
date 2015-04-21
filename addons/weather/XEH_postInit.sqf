#include "script_component.hpp"

call FUNC(getMapData);

// Randomization
GVAR(temperatureShift) = 3 - random 6;
GVAR(badWeatherShift) = (random 1) ^ 2 * 10;
GVAR(humidityShift) = (5 - random 10) / 100;

// Rain variables
GVAR(enableRain) = true;
GVAR(rain_next_period) = -1;
GVAR(rain_period_count) = 0;
GVAR(rain_initial_rain) = 0;
if(overcast >= 0.7) then {
    GVAR(rain_initial_rain) = (random ((overcast-0.7)/0.3));
};
GVAR(current_rain) = GVAR(rain_initial_rain);
GVAR(rain_current_range) = -1+(random 2);
GVAR(overcast_multiplier) = 1;

// Wind Variables
call FUNC(initWind);

"ACE_WIND_PARAMS" addPublicVariableEventHandler { GVAR(wind_period_start_time) = time; };
"ACE_RAIN_PARAMS" addPublicVariableEventHandler { GVAR(rain_period_start_time) = time; };
"ACE_MISC_PARAMS" addPublicVariableEventHandler {
    if !(isServer) then {
        30 setLightnings (ACE_MISC_PARAMS select 0);
        30 setRainbow    (ACE_MISC_PARAMS select 1);
        30 setFog        (ACE_MISC_PARAMS select 2);
        GVAR(temperatureShift) = (ACE_MISC_PARAMS select 3);
        GVAR(badWeatherShift)  = (ACE_MISC_PARAMS select 4);
        GVAR(humidityShift)    = (ACE_MISC_PARAMS select 5);
        call FUNC(updateTemperature);
        call FUNC(updateHumidity);
    };
};

["ACE3", QGVAR(WindInfoKey), localize "STR_ACE_Weather_WindInfoKey",
{
    // Conditions: canInteract
    if !([ACE_player, objNull, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayWindInfo);
},
{false},
[37, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (SHIFT + K)

simulWeatherSync;

[FUNC(updateTemperature), 20, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateHumidity), 20, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateWind), 1, []] call CBA_fnc_addPerFrameHandler;
[FUNC(updateRain), 2, []] call CBA_fnc_addPerFrameHandler;