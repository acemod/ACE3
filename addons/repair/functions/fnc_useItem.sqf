/*
 * Author: Glowbal
 * Use Equipment if any is available.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Item classname <STRING>
 *
 * ReturnValue:
 * [Had Item to Use <BOOL>, Unit <OBJECT>] <ARRAY>
 *
 * Example:
 * [unit, "classname"] call ace_repair_fnc_useItem
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit", "_item"];
TRACE_2("params",_unit,_item);

if ([_unit, _item] call EFUNC(common,hasItem)) exitwith {
    [[_unit, _item], QUOTE(EFUNC(common,useItem)), _unit] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    [true, _unit];
};

[false, objNull];
