#include "script_component.hpp"

// Randomization
GVAR(temperatureShift) = 3 - random 6;
GVAR(badWeatherShift) = (random 1) ^ 2 * 10;
GVAR(humidityShift) = (5 - random 10) / 100;

GVAR(wind_period_start_time) = ACE_time;
GVAR(rain_period_start_time) = ACE_time;

GVAR(ACE_rain) = rain;



"ACE_WIND_PARAMS" addPublicVariableEventHandler { GVAR(wind_period_start_time) = ACE_time; };
"ACE_RAIN_PARAMS" addPublicVariableEventHandler { GVAR(rain_period_start_time) = ACE_time; };
"ACE_MISC_PARAMS" addPublicVariableEventHandler {
    if (!isServer) then {
        if (GVAR(syncMisc)) then {
            30 setLightnings (ACE_MISC_PARAMS select 0);
            30 setRainbow    (ACE_MISC_PARAMS select 1);
            30 setFog        (ACE_MISC_PARAMS select 2);
        };
        GVAR(temperatureShift) = (ACE_MISC_PARAMS select 3);
        GVAR(badWeatherShift)  = (ACE_MISC_PARAMS select 4);
        GVAR(humidityShift)    = (ACE_MISC_PARAMS select 5);
        call FUNC(updateTemperature);
        call FUNC(updateHumidity);
    };
};

["ACE3 Common", QGVAR(WindInfoKey), localize LSTRING(WindInfoKey),
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
[{
    if (GVAR(syncRain)) then {
        0 setRain GVAR(ACE_rain);
    };
}, 0, []] call CBA_fnc_addPerFrameHandler;
