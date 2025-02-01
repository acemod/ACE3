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
 * [] call ace_tacphone_bft_fnc_createApp
 *
 * Public: No
 */

params ["_display", "_appSection"];

private _fullSize = [0, 0, (ctrlPosition _appSection)#2, (ctrlPosition _appSection)#3];

GVAR(appsection) = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1, _appSection];
GVAR(appsection) ctrlSetPosition _fullSize;
GVAR(appsection) ctrlCommit 0;

_map = _display ctrlCreate [QEGVAR(tacphone,mapControl), -1, GVAR(appsection)];
_map ctrlMapSetPosition [0, 0, (ctrlPosition GVAR(appsection))#2, (ctrlPosition GVAR(appsection))#3]; 
_map ctrlCommit 0;
private _plrPos = _map ctrlMapWorldToScreen position player;

_map ctrlAddEventHandler ["Draw", {
    params ["_ctrl"];
    /*
        Move to separate function. Group drawing & unit drawing should be separate.
    */
    _ctrl drawIcon ["\A3\ui_f\data\map\markers\nato\b_air.paa", [1,0,0,1], getPosASLVisual player, 20, 20, 0, "boobies!!", 0, -1]
}];

_map ctrlAddEventHandler ["MouseButtonDblClick", {
    params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
    private _worldPos = (_control ctrlMapScreenToWorld [_xPos, _yPos]);
    
    /*
        Create map marker menu. Should be separate function.
    */
}];