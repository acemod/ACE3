#include "script_component.hpp"

if (["STMapGestures"] call EFUNC(common,isModLoaded)) exitWith {
    ACE_LOGWARNING("st_map_gestures is installed - exiting [remove st_map_gestures.pbo to allow ace version]");
};

if (!hasInterface) exitWith {};

["SettingsInitialized", {
    if (!GVAR(enabled)) exitWith {};
    [{
        if (isNull (findDisplay 12)) exitWith {};

        params ["", "_pfhId"];

        call FUNC(receiverInit);
        call FUNC(transmitterInit);

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    }, 1, []] call CBA_fnc_addPerFrameHandler;
}] call EFUNC(common,addEventHandler);
