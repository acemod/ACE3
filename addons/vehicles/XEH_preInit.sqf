#include "script_component.hpp"

ADDON = false;

PREP_RECOMPILE_START;
#include "XEH_PREP.hpp"
PREP_RECOMPILE_END;

#include "initSettings.sqf"

if (GVAR(keepEngineRunning)) then {
    [
        "AllVehicles",
        "initPost",
        {(_this select 0) setVariable [QGVAR(engineState), isEngineOn (_this select 0)]}
    ] call CBA_fnc_addClassEventHandler;
    [
        "AllVehicles",
        "engine",
        {(_this select 0) setVariable [QGVAR(engineState), _this select 1]}
    ] call CBA_fnc_addClassEventHandler;
    [
        "AllVehicles",
        "getout",
        {
            params ["_vehicle","_position","_unit"];
            if (_unit == ACE_player && {_position == "driver"} && {_vehicle getVariable [QGVAR(engineState), false]}) then {
                [{
                    [QEGVAR(common,engineOn), _this, _this select 0] call CBA_fnc_targetEvent;
                }, [_vehicle, true]] call CBA_fnc_execNextFrame;
            };
        }
    ] call CBA_fnc_addClassEventHandler;
};

ADDON = true;
