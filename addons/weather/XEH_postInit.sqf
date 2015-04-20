#include "script_component.hpp"

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
ACE_wind = [0, 0, 0];
GVAR(wind_initial_dir) = (random 360);
GVAR(wind_initial_speed) = (overcast*5)+(random (overcast*5)) max 1;
GVAR(wind_mean_speed) = GVAR(wind_initial_speed);
GVAR(wind_mean_dir) = GVAR(wind_initial_dir);
GVAR(wind_current_speed) = GVAR(wind_initial_speed);
GVAR(wind_current_dir) = GVAR(wind_initial_dir);
GVAR(wind_current_range_speed) = -1+(random 2);
GVAR(wind_current_range_dir) = -1+(random 2);
GVAR(wind_next_period) = -1; //ceil((2+random(5))/(GVAR(overcast_multiplier)/10));
GVAR(wind_next_major_period) = -1;
GVAR(wind_period_count) = 0;
GVAR(wind_major_period_count) = 0;
GVAR(wind_total_time) = 0;
GVAR(wind_period_start_time) = time;

call FUNC(getMapData);

"ACE_WIND_PARAMS" addPublicVariableEventHandler { GVAR(wind_period_start_time) = time; };
"ACE_RAIN_PARAMS" addPublicVariableEventHandler { GVAR(rain_period_start_time) = time; };
"ACE_MISC_PARAMS" addPublicVariableEventHandler {
    if !(isServer) then {
        30 setLightnings (ACE_MISC_PARAMS select 0);
        30 setRainbow    (ACE_MISC_PARAMS select 1);
        30 setFog        (ACE_MISC_PARAMS select 2);
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