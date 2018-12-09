#include "script_component.hpp"
/*
 * Author: Dystopian
 * Wrapper for BIS_fnc_addVirtualItemCargo.
 *
 * Arguments:
 * 0: Box <OBJECT>
 * 1: Items <STRING, ARRAY, BOOL>
 * 2: Add globally <BOOL> (default: false)
 * 3: Init box <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject, "Toolkit"] call ace_arsenal_fnc_wrapper_addVirtualItemCargo
 *
 * Public: No
*/

WAIT_AND_CHECK_SETTING(addVirtualItemCargo);

params [["_box", ACE_player, [objNull]], ["_items", [], ["", [], true]], ["_isGlobal", false, [false]], ["_initBox", true, [true]]];

if (_items isEqualType "") then {_items = [_items]};
if (_items isEqualType [] && {0 < count _items} && {"%All" == _items select 0}) then {
    _items = true;
};

[_box, _items, _isGlobal] call FUNC(addVirtualItems);

if (_initBox) then {
    [_box, false] call FUNC(initBox);
};
