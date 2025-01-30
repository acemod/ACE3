#include "..\script_component.hpp"
/*
 * Author: KJW
 * Loads BFT application
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_tacphone_fnc_loadBFT
 *
 * Public: No
 */

if !(isNil QGVAR(map)) then {ctrlDelete GVAR(map)}; // Clean up any accidents

GVAR(map) = _emptyDisplay ctrlCreate [QGVAR(mapControl), -1];
GVAR(map) ctrlMapSetPosition [(1-WIDTH)/2, (1-HEIGHT)/2, WIDTH, HEIGHT]; 
GVAR(map) ctrlCommit 0;
private _plrPos = GVAR(map) ctrlMapWorldToScreen position player;

GVAR(map) ctrlAddEventHandler ["Draw", {
    params ["_ctrl"];
    _ctrl drawIcon ["\A3\ui_f\data\map\markers\nato\b_air.paa", [1,0,0,1], getPosASLVisual player, 20, 20, 0, "boobies!!", 0, -1]
}];

GVAR(map) ctrlAddEventHandler ["MouseButtonDblClick", {
    params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
    private _worldPos = (_control ctrlMapScreenToWorld [_xPos, _yPos]);
    
    /*
        Create map marker menu.
    */
}];