#include "..\script_component.hpp"
/*
 * Author: KJW
 * Switches the TacPhone to a different app
 * Closes currently active app, opens new one
 *
 * Arguments:
 * TacPhone to switch the app on <DISPLAY>
 * Classname of the new app to be switched to <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display, "Homescreen"] call ace_tacphone_fnc_switchToApp
 *
 * Public: No
 */

params ["_display", "_classname"];

private _getAppConfig = {
    private _cfg = missionConfigFile >> QGVAR(apps) >> _this;
    if (isNull _cfg) then {
        _cfg = configFile >> QGVAR(apps) >> _this;
    };
    _cfg // Might be configNull if no app was actually found
};

private _newAppCfg = _classname call _getAppConfig;

// First close the currently open app
if (GVAR(app_selected) != "") then {
    private _oldAppCfg = GVAR(app_selected) call _getAppConfig;

    // Notify app that its closing
    private _function = getText (_oldAppCfg >> QGVAR(onClose)); //#TODO handle entry not existing?
    private _code = missionNamespace getVariable [_function, ""];
    if (_code isEqualTo "") exitWith {}; // Incorrect function name
    [_display, GVAR(appsection)] call _code; //#TODO maybe pass the new app's classname, so it knows why its being closed?

    GVAR(app_selected) = ""; // None open now
};

// Now no apps are open, previous apps might have left controls behind, we cannot delete them because their onClose might be async and still need them
// but we can at least make sure they are not visible
{ _x ctrlShow false; } forEach allControls GVAR(appsection);


// Now we open the new app

systemChat str _classname;

GVAR(app_selected) = _classname; // We will now get into it

private _function = getText (_newAppCfg >> QGVAR(createApp));

private _code = missionNamespace getVariable [_function, ""];
if (_code isEqualTo "") exitWith {}; // Incorrect function name
[_display, GVAR(appsection)] call _code;