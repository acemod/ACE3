#include "..\script_component.hpp"
/*
 * Author: KJW
 * Loads tacphone
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_fnc_loadPhone
 *
 * Public: No
 */

/*


This is absolutely not even slightly feature complete nor organised.


*/

private _emptyDisplay = findDisplay 46 createDisplay "RscDisplayEmpty";
GVAR(background) = _emptyDisplay ctrlCreate ["RscPicture", -1];

GVAR(background) ctrlSetPosition [(1-(PHONE_WIDTH+0.1))/2, (1-(PHONE_HEIGHT+0.1))/2, PHONE_WIDTH+0.1, PHONE_HEIGHT+0.1];
GVAR(background) ctrlSetText "#(rgb,1,1,1)color(0.3,0.3,0.3,1)";
GVAR(background) ctrlCommit 0;

GVAR(app_selected) = ""; // May be worth making the home screen just the default app rather than special handling..?

if (GVAR(app_selected) isEqualTo "") then {
    GVAR(home_background) = _emptyDisplay ctrlCreate ["RscPicture", -1];
    GVAR(home_background) ctrlSetPosition [(1-PHONE_WIDTH)/2, (1-PHONE_HEIGHT)/2, PHONE_WIDTH, PHONE_HEIGHT];
    GVAR(home_background) ctrlSetText "#(rgb,1,1,1)color(0.1,0.1,0.1,1)";
    GVAR(home_background) ctrlCommit 0;
    GVAR(home_background) ctrlAddEventHandler ["Destroy",{
        {
            _x params ["_app","_appLabel"];
            ctrlDelete _app;
            ctrlDelete _appLabel;
        } forEach GVAR(home_background_apps);
    }];
    
    private _apps = "getNumber (_x >> 'scope') > 0" configClasses (configFile >> QGVAR(apps));
    _apps = _apps + ("getNumber (_x >> 'scope') > 0" configClasses (missionConfigFile >> QGVAR(apps)));
    _apps = _apps apply {[configName _x, getText (_x >> "displayName"), getText (_x >> "displayNameShort"), getText (_x >> "icon")]};
    
    private _page = 0;
    
    private _columns = 5;
    private _rows = 3;
        
    private _spacingX = 0.15;
    private _spacingY = 0.15;
        
    private _startX = ((1-PHONE_WIDTH)/2)+0.025;
    private _startY = (1-PHONE_HEIGHT)/2;
    
    GVAR(home_background_apps) = [];
        
    {
        _x params ["_classname", "_displayName","_displayNameShort","_picture"];
        
        private _column = _forEachIndex mod _columns;
        private _row = floor (_forEachIndex/_columns);	
         
        private _app = _emptyDisplay ctrlCreate ["RscActivePicture", -1, GVAR(home_background)];
        private _appLabel = _emptyDisplay ctrlCreate ["RscText", -1, _app];
        
        _apps pushBack [_app,_appLabel];
        
        _app ctrlSetText _picture;
        _appLabel ctrlSetText _displayNameShort;
        
        private _coordX = _startX + (_column * _spacingX);
        private _coordY = _startY + (_row * _spacingY);
        
        _app ctrlSetPosition [_coordX, _coordY, 0.1, 0.1];
        _appLabel ctrlSetPosition [_coordX+0.025, _coordY+0.06, 0.1, 0.1]; // Just need to center the text in this textbox... Dunno how.
        
        _app setVariable [QGVAR(appClassname),_classname];
        _app setVariable [QGVAR(display),_emptyDisplay];
        
        _app ctrlAddEventHandler ["MouseButtonClick",{
            params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
            private _appClassname = _control getVariable [QGVAR(appClassname),""];
            private _display = _control getVariable [QGVAR(display),displayNull];
            if (_appClassname isNotEqualTo "") then {
                [QGVAR(loadApp),[_appClassname,_display]] call CBA_fnc_localEvent;
                GVAR(app_selected) = _appClassname;
                systemChat str _appClassname;
            };
        }];
        
        _app ctrlCommit 0;
        _appLabel ctrlCommit 0;
    
    } forEach (_apps select [_page, 15]);
};