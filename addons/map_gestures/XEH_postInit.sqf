#include "script_component.hpp"

if (!hasInterface) exitWith {};

["SettingsInitialized", {
    [{
        if (isNull (findDisplay 12)) exitWith {};

        params ["", "_pfhId"];

        call FUNC(receiverInit);
        call FUNC(transmitterInit);

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    }, 1, []] call CBA_fnc_addPerFrameHandler;
}] call EFUNC(common,addEventHandler);
