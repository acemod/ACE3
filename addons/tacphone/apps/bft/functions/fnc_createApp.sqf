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

params ["_display"];

GVAR(appsection) = _display ctrlCreate ["RscControlsGroupNoScrollbars", -1];

//#TODO this should be [0,0, (ctrlPosition _parent)#2, (ctrlPosition_parent)#3] and the parent gives us a controlsgroup to insert our things into
GVAR(appsection) ctrlSetPosition [(1-PHONE_WIDTH)/2, (1-PHONE_HEIGHT)/2, PHONE_WIDTH, PHONE_HEIGHT];
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