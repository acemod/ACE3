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
ace_tacphone_background = _emptyDisplay ctrlCreate ["RscPicture", -1];

#define WIDTH 0.75
#define HEIGHT 0.5

ace_tacphone_background ctrlSetPosition [(1-(WIDTH+0.1))/2, (1-(HEIGHT+0.1))/2, WIDTH+0.1, HEIGHT+0.1];
ace_tacphone_background ctrlSetText "#(rgb,1,1,1)color(0.3,0.3,0.3,1)";
ace_tacphone_background ctrlCommit 0;

ace_tacphone_app_selected = "";

if (ace_tacphone_app_selected isEqualTo "") then {
    ace_tacphone_home_background = _emptyDisplay ctrlCreate ["RscPicture", -1];
    ace_tacphone_home_background ctrlSetPosition [(1-WIDTH)/2, (1-HEIGHT)/2, WIDTH, HEIGHT];
    ace_tacphone_home_background ctrlSetText "#(rgb,1,1,1)color(0.1,0.1,0.1,1)";
    ace_tacphone_home_background ctrlCommit 0;
    
    private _apps = "getNumber (_x >> 'scope') > 0" configClasses (configFile >> "ace_tacphone_apps");
    _apps apply {[getText (_x >> "displayName"), getText (_x >> "displayNameShort"), getText (_x >> "icon")]};
    
    private _page = 0;
    
    private _columns = 5;
    private _rows = 3;
        
    private _spacingX = 0.15;
    private _spacingY = 0.15;
        
    private _startX = ((1-WIDTH)/2)+0.025;
    private _startY = (1-HEIGHT)/2;
        
    {
        _x params ["_displayName","_displayNameShort","_picture","_statement"];
        
        private _column = _forEachIndex mod _columns;
        private _row = floor (_forEachIndex/_columns);	
         
        private _app = _emptyDisplay ctrlCreate ["RscActivePicture", -1, ace_tacphone_home_background];
        private _appLabel = _emptyDisplay ctrlCreate ["RscText", -1, _app];
        
        _app ctrlSetText _picture;
        _appLabel ctrlSetText _displayNameShort;
        
        private _coordX = _startX + (_column * _spacingX);
        private _coordY = _startY + (_row * _spacingY);
        
        _app ctrlSetPosition [_coordX, _coordY, 0.1, 0.1];
        _appLabel ctrlSetPosition [_coordX+0.035, _coordY+0.06, 0.1, 0.1];
        
        _app ctrlCommit 0;
        _appLabel ctrlCommit 0;
    
    } forEach (_apps select [_page, 15]);
    
};

if (ace_tacphone_app_selected == "map") then {
    ace_tacphone_map = _emptyDisplay ctrlCreate ["ace_tacphone_mapControl", -1];
    ace_tacphone_map ctrlMapSetPosition [(1-WIDTH)/2, (1-HEIGHT)/2, WIDTH, HEIGHT]; 
    ace_tacphone_map ctrlCommit 0;
    private _plrPos = ace_tacphone_map ctrlMapWorldToScreen position player;

    ace_tacphone_map ctrlAddEventHandler ["Draw", {
        params ["_ctrl"];
        _ctrl drawIcon ["\A3\ui_f\data\map\markers\nato\b_air.paa", [1,0,0,1], getPosASLVisual player, 20, 20, 0, "boobies!!", 0, -1]
    }];

    ace_tacphone_map ctrlAddEventHandler ["MouseButtonDblClick", {
        params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
        private _worldPos = (_control ctrlMapScreenToWorld [_xPos, _yPos]);
        
        /*
            Create map marker menu.
        */
    }];
};