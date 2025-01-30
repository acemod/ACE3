#include "..\script_component.hpp"
/*
 * Author: KJW
 * Loads BFT application
 *
 * Arguments:
 * 0: Tacphone Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_display] call ace_tacphone_fnc_loadBFT
 *
 * Public: No
 */

params ["_display"];

if !(isNil QGVAR(map)) then {ctrlDelete GVAR(map)}; // Clean up any accidents

GVAR(map) = _display ctrlCreate [QGVAR(mapControl), -1];
GVAR(map) ctrlMapSetPosition [(1-PHONE_WIDTH)/2, (1-PHONE_HEIGHT)/2, PHONE_WIDTH, PHONE_HEIGHT]; 
GVAR(map) ctrlCommit 0;
private _plrPos = GVAR(map) ctrlMapWorldToScreen position player;

GVAR(map) ctrlAddEventHandler ["Draw", {
    params ["_ctrl"];
    /*
        Move to separate function. Group drawing & unit drawing should be separate.
    */
    _ctrl drawIcon ["\A3\ui_f\data\map\markers\nato\b_air.paa", [1,0,0,1], getPosASLVisual player, 20, 20, 0, "boobies!!", 0, -1]
}];

GVAR(map) ctrlAddEventHandler ["MouseButtonDblClick", {
    params ["_control", "_button", "_xPos", "_yPos", "_shift", "_ctrl", "_alt"];
    private _worldPos = (_control ctrlMapScreenToWorld [_xPos, _yPos]);
    
    /*
        Create map marker menu. Should be separate function.
    */
}];