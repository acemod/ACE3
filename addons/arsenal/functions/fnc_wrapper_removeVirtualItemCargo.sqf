#include "script_component.hpp"
/*
 * Author: Dystopian
 * Wrapper for BIS_fnc_removeVirtualItemCargo.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Items <STRING, ARRAY, BOOL>
 * 2: Remove globally <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "Toolkit"] call ace_arsenal_fnc_wrapper_removeVirtualItemCargo
 *
 * Public: No
*/

WAIT_AND_CHECK_SETTING(removeVirtualItemCargo);

params [["_box", ACE_player, [objNull]], ["_items", [], ["", [], true]], ["_isGlobal", false, [false]]];

if (_items isEqualType "") then {_items = [_items]};
if (_items isEqualType [] && {0 < count _items} && {"%All" == _items select 0}) then {
    _items = true;
};

[_box, _items, _isGlobal] call FUNC(removeVirtualItems);
