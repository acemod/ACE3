#include "script_component.hpp"

if (["STMapGestures"] call EFUNC(common,isModLoaded)) exitWith {
    WARNING("st_map_gestures is installed - exiting [remove st_map_gestures.pbo to allow ace version]");
};

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    [{!isNull (findDisplay 12)}, {
        call FUNC(bindEventHandlers);
    }] call CBA_fnc_waitUntilAndExecute;

    ["visibleMap", {
        GVAR(EnableTransmit) = false;
        ACE_player setVariable [QGVAR(pointPosition), nil, true];  // Instantly transmit nil to stop drawing icon
    }, true] call CBA_fnc_addPlayerEventHandler;

}] call CBA_fnc_addEventHandler;
