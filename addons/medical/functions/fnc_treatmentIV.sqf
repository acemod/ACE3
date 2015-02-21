/*
 * Author: Glowbal
 * Patient IV Treatment callback
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: SelectionName <STRING>
 * 3: Treatment classname <STRING>
 *
 *
 * Return Value:
 * <BOOL>
 *
 * Public: Yes
 */


#include "script_component.hpp"

private ["_caller", "_target", "_selectionName", "_className", "_items", "_removeItem", "_attributes"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (count _items == 0) exitwith {};

if ([_caller, _target, _items] call FUNC(useEquipment)) then {
    _removeItem = _items select 0;
    [[_target, _removeItem], QUOTE(FUNC(treatmentIVLocal)), _target] call EFUNC(common,execRemoteFnc);
};
