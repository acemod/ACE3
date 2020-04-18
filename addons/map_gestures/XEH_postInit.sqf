#include "script_component.hpp"

if (["STMapGestures"] call EFUNC(common,isModLoaded)) exitWith {
    WARNING("st_map_gestures is installed - exiting [remove st_map_gestures.pbo to allow ace version]");
};

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};

    GVAR(pointPosition) = [0,0,0];

    [{
        if (isNull (findDisplay 12)) exitWith {};

        params ["", "_pfhId"];

        call FUNC(receiverInit);
        call FUNC(transmitterInit);

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    }, 1, []] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
