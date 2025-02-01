#include "..\script_component.hpp"
/*
 * Author: KJW
 * Initializes the App
 *
 * Arguments:
 * TacPhone main display
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_homescreen_fnc_createApp
 *
 * Public: No
 */

params ["_display", "_appSection"];

private _fullSize = [0, 0, (ctrlPosition _appSection)#2, (ctrlPosition _appSection)#3];

GVAR(appsection) = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1, _appSection];
GVAR(appsection) ctrlSetPosition _fullSize;
GVAR(appsection) ctrlCommit 0;

private _background = _display ctrlCreate ["RscPicture", -1, GVAR(appsection)];
_background ctrlSetPosition _fullSize;
_background ctrlSetText /*"#(rgb,1,1,1)color(0.1,0.1,0.1,1)"*/ QPATHTOF(data\background_banana.paa);
_background ctrlCommit 0;

private _apps = "getNumber (_x >> 'scope') > 1" configClasses (configFile >> QEGVAR(tacphone,apps));
_apps = _apps + ("getNumber (_x >> 'scope') > 1" configClasses (missionConfigFile >> QEGVAR(tacphone,apps)));
_apps = _apps apply {[configName _x, getText (_x >> "displayName"), getText (_x >> "displayNameShort"), getText (_x >> "icon")]};

private _page = missionNamespace getVariable [QGVAR(home_pageNo),0];

private _columns = 5;
private _rows = 3;

private _spacingX = 0.15;
private _spacingY = 0.15;
GVAR(home_background_apps) = [];

{
    _x params ["_classname", "_displayName","_displayNameShort","_picture"];
    
    private _column = _forEachIndex mod _columns;
    private _row = floor (_forEachIndex/_columns);    
        
    private _app = _display ctrlCreate ["RscActivePicture", -1, GVAR(appsection)];
    private _appLabel = _display ctrlCreate ["RscText", -1, GVAR(appsection)];
    
    GVAR(home_background_apps) pushBack [_app,_appLabel];
    
    _app ctrlSetText _picture;
    _appLabel ctrlSetText _displayNameShort;
    
    private _coordX = _column * _spacingX;
    private _coordY = _row * _spacingY;
    
    _app ctrlSetPosition [_coordX, _coordY, 0.1, 0.1];
    _appLabel ctrlSetPosition [_coordX+0.025, _coordY+0.06, 0.1, 0.1]; // Just need to center the text in this textbox... Dunno how.
    
    _app setVariable [QEGVAR(tacphone,appClassname), _classname];
    _app setVariable [QEGVAR(tacphone,display), _display];
    
    _app ctrlAddEventHandler ["MouseButtonClick",{
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
        private _appClassname = _control getVariable [QEGVAR(tacphone,appClassname),""];
        private _display = _control getVariable [QEGVAR(tacphone,display),displayNull];

        if (_appClassname isNotEqualTo "") then {
            [_display, _appClassname] call EFUNC(tacphone,switchToApp);
        };
    }];
    
    _app ctrlCommit 0;
    _appLabel ctrlCommit 0;

} forEach (_apps select [_page, 15]);
