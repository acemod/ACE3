#include "script_component.hpp"

#include "initKeybinds.inc.sqf"

[QGVAR(loadApp), {
    params ["_classname","_display"];

    private _getAppConfig = {
        private _cfg = missionConfigFile >> QGVAR(apps) >> _this;
        if (isNull _cfg) then {
            _cfg = configFile >> QGVAR(apps) >> _this;
        };
        _cfg // Might be configNull if no app was actually found
    };

    private _newAppCfg = _classname call _getAppConfig;

    if (GVAR(app_selected) != "") then {
        private _oldAppCfg = GVAR(app_selected) call _getAppConfig;

        // Notify app that its closing
        private _function = getText (_oldAppCfg >> QGVAR(onClose)); //#TODO handle entry not existing?
        private _code = missionNamespace getVariable [_function,""];
        if (_code isEqualTo "") exitWith {}; // Incorrect function name
        [_display] call _code; //#TODO maybe pass the new app's classname, so it knows why its being closed?

        GVAR(app_selected) = ""; // None open now
    };

    systemChat str _classname;

    GVAR(app_selected) = _classname; // We will now get into it

    private _function = getText (_newAppCfg >> QGVAR(createApp));
    
    private _code = missionNamespace getVariable [_function,""];
    if (_code isEqualTo "") exitWith {}; // Incorrect function name
    [_display] call _code;
}] call CBA_fnc_addEventHandler;