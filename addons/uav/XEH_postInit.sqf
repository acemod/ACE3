#include "script_component.hpp"

["Air", "init", {
    params ["_vehicle"];
    if (!unitIsUAV _vehicle) exitWith {};
    if (!hasPilotCamera _vehicle) exitWith {};

    GVAR(pfehID) = [{
        params ["_args", "_pfID"];
        _args params ["_vehicle"];

        if (isNull _vehicle) exitWith {
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };
        if (!alive _vehicle) exitWith {
            [_pfID] call CBA_fnc_removePerFrameHandler;
        };
        if ("GUNNER" in (UAVControl _vehicle)) exitWith {
            _vehicle lockCameraTo [objNull, [0]];
        };
        if ((getPilotCameraTarget _vehicle) select 0) then {
            _vehicle lockCameraTo [getPilotCameraTarget _vehicle select 1, [0]]; 
        } else {
            _vehicle lockCameraTo [objNull, [0]];
        };

    }, 0.1, [_vehicle]] call CBA_fnc_addPerFrameHandler;
}, true, [], true] call CBA_fnc_addClassEventHandler;
