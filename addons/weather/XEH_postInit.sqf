#include "script_component.hpp"

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

["ace_settingsInitialized",{
    TRACE_2("ace_settingsInitialized eh",GVAR(updateInterval),GVAR(enabled));
    
    if (GVAR(enabled)) then {
        [{
            [] call FUNC(updateWind);
            if (isMultiplayer && isServer) then {
                // Initiate (vanilla) wind update
                setWind [ACE_wind select 0, ACE_wind select 1, true];
            };
        }, 1] call CBA_fnc_addPerFrameHandler;

        [{
            [] call FUNC(updateTemperature);
            [] call FUNC(updateHumidity);
        }, GVAR(updateInterval), []] call CBA_fnc_addPerFrameHandler;
    } else {
        GVAR(currentTemperature) = 15;
        GVAR(currentHumidity) = 0;
        GVAR(currentOvercast) = 0;
        [{ACE_wind = wind;}, 1] call CBA_fnc_addPerFrameHandler;
    };

}] call CBA_fnc_addEventHandler;
