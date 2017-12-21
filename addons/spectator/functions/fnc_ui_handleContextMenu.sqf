/*
 * Author: SilentSpike
 * Function used to handle creating the context menu upon right clicking the units list
 *
 * Expected behaviour:
 * Right clicking the list creates a context menu with relevant toggles and entries at the cursor position
 *
 * Arguments:
 * 0: List <CONTROL>
 * 1: Mouse button <NUMBER>
 * 1: X Coordinate <NUMBER>
 * 1: Y Coordinate <NUMBER>
 * 1: Shift <BOOL>
 * 1: Ctrl <BOOL>
 * 1: Alt <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [false, _this] call ace_spectator_fnc_ui_handleListClick
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_list", "_button", "_x", "_y"];

// Don't create more than one context menu
if !(isNull (GETUVAR(GVAR(context),controlNull))) exitWith {};

// Right clicked
if (_button == 1) then {
    private _menu = (ctrlParent _list) ctrlCreate [QGVAR(contextMenu), -1];

    _menu ctrlSetPosition [_x,_y];
    _menu ctrlCommit 0;

    ctrlSetFocus _menu;

    SETUVAR(GVAR(context),_menu);
};
