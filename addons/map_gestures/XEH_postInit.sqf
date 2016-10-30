#include "script_component.hpp"

if (["STMapGestures"] call EFUNC(common,isModLoaded)) exitWith {
    WARNING("st_map_gestures is installed - exiting [remove st_map_gestures.pbo to allow ace version]");
};

if (!hasInterface) exitWith {};

["ace_settingsInitialized", {
    if (!GVAR(enabled)) exitWith {};
    
    // This will set QEGVAR(common,playerOwner) var on player objects
    [] call EFUNC(common,setPlayerOwner);
    
    GVAR(pointPosition) = [0,0,0];

    [QGVAR(syncPos), {
        params ["_unit", "_pointPos"];
        _unit setVariable [QGVAR(pointPosition), _pointPos];
    }] call CBA_fnc_addEventHandler;

    [{
        if (isNull (findDisplay 12)) exitWith {};

        params ["", "_pfhId"];

        call FUNC(receiverInit);
        call FUNC(transmitterInit);

        [_pfhId] call CBA_fnc_removePerFrameHandler;
    }, 1, []] call CBA_fnc_addPerFrameHandler;
}] call CBA_fnc_addEventHandler;
