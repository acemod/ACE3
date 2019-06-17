#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

[
    "AllVehicles",
    "initPost",
    {
        params ["_vehicle"];
        _vehicle setVariable [QGVAR(engineState), isEngineOn _vehicle];
    }
] call CBA_fnc_addClassEventHandler;
[
    "AllVehicles",
    "engine",
    {
        params ["_vehicle", "_state"];
        _vehicle setVariable [QGVAR(engineState), _state];
    }
] call CBA_fnc_addClassEventHandler;
[
    "AllVehicles",
    "getout",
    {
        params ["_vehicle", "_position", "_unit"];
        if (!GVAR(keepEngineRunning)) exitWith {};
        if (_unit == ACE_player && {_position == "driver" && {_vehicle getVariable [QGVAR(engineState), false]}}) then {
            [{
                params ["_vehicle"];
                [QEGVAR(common,engineOn), _this, _vehicle] call CBA_fnc_targetEvent;
            }, [_vehicle, true]] call CBA_fnc_execNextFrame;
        };
    }
] call CBA_fnc_addClassEventHandler;

ADDON = true;
