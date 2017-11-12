#include "script_component.hpp"

// Randomization
GVAR(temperatureShift) = 3 - random 6;
GVAR(badWeatherShift) = (random 1) ^ 2 * 10;
GVAR(humidityShift) = (5 - random 10) / 100;

GVAR(wind_period_start_time) = CBA_missionTime;

"ACE_WIND_PARAMS" addPublicVariableEventHandler { GVAR(wind_period_start_time) = CBA_missionTime; };
if (!isServer) then {
    "ACE_MISC_PARAMS" addPublicVariableEventHandler {
        TRACE_1("MISC PARAMS PVEH",ACE_MISC_PARAMS);
        if (GVAR(syncMisc)) then {
            30 setRainbow    (ACE_MISC_PARAMS select 0);
            30 setFog        (ACE_MISC_PARAMS select 1);
        };
        GVAR(temperatureShift) = (ACE_MISC_PARAMS select 2);
        GVAR(badWeatherShift)  = (ACE_MISC_PARAMS select 3);
        GVAR(humidityShift)    = (ACE_MISC_PARAMS select 4);
        call FUNC(updateTemperature);
        call FUNC(updateHumidity);
    };
};

GVAR(WindInfo) = false;
["ACE3 Common", QGVAR(WindInfoKey), localize LSTRING(WindInfoKeyToggle),
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayWindInfo);
},
{false},
[37, [true, false, false]], false, 0] call CBA_fnc_addKeybind; // (SHIFT + K)

["ACE3 Common", QGVAR(WindInfoKey_hold), localize LSTRING(WindInfoKeyHold),
{
    // Conditions: canInteract
    if !([ACE_player, ACE_player, []] call EFUNC(common,canInteractWith)) exitWith {false};

    // Statement
    [] call FUNC(displayWindInfo);
},
{
    GVAR(WindInfo) = false;
    (["RscWindIntuitive"] call BIS_fnc_rscLayer) cutText ["", "PLAIN", 2];
},
[0, [false, false, false]], false, 0] call CBA_fnc_addKeybind; // (empty default key)

simulWeatherSync;




["ace_settingsInitialized",{
    // Create a 1 sec delay PFEH to update wind/temp/humidity
    GVAR(nextUpdateTempAndHumidity) = 0;
    [{
        BEGIN_COUNTER(weatherPFEH);

        [] call FUNC(updateWind); //Every 1 second

        if (CBA_missionTime >= GVAR(nextUpdateTempAndHumidity)) then {
            [] call FUNC(updateTemperature); //Every 20 seconds
            [] call FUNC(updateHumidity); //Every 20 seconds
            GVAR(nextUpdateTempAndHumidity) = 20 + CBA_missionTime;
        };

        END_COUNTER(weatherPFEH);
    }, 1, []] call CBA_fnc_addPerFrameHandler;

}] call CBA_fnc_addEventHandler;
