#include "script_component.hpp"

#include "initKeybinds.inc.sqf"

[QGVAR(loadApp), {
    params ["_classname","_display"];

    private _cfg = configFile >> QGVAR(apps) >> _classname;
    if (isNull _cfg) then {
        _cfg = missionConfigFile >> QGVAR(apps) >> _classname;
        if (isNull _cfg) exitWith {}; // No app was actually found
    };
    private _function = getText (_cfg >> "function");
    
    private _code = missionNamespace getVariable [_function,""];
    if (_code isEqualTo "") exitWith {}; // Incorrect function name
    [_display] call _code;

    [{ctrlDelete GVAR(home_background);}, []] call CBA_fnc_execNextFrame;

}] call CBA_fnc_addEventHandler;