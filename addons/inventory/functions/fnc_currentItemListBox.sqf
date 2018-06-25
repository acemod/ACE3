#include "script_component.hpp"
/*
 * Author: commy2
 * Returns the current item list box of given inventory display.
 * These can be Ground, Soldier, Uniform, Backpack or Vest.
 * Can also be Weapon since 1.52, but that apparently uses one of the above.
 *
 * Arguments:
 * 0: Inventory display <DISPLAY>
 *
 * Return Value:
 * Currently selected item list box <CONTROL>
 *
 * Example:
 * [DISPLAY] call ACE_inventory_fnc_currentItemListBox
 *
 * Public: No
 */

params ["_display"];

scopeName "main";

{
    private _control = _display displayCtrl _x;

    if (ctrlShown _control) then {
        _control breakOut "main";
    };
    false
} count [IDC_ITEMLIST_GROUND, IDC_ITEMLIST_SOLDIER, IDC_ITEMLIST_UNIFORM, IDC_ITEMLIST_VEST, IDC_ITEMLIST_BACKPACK];

-1
