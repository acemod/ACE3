/*
 * Author: Glowbal
 * Use Equipment if any is available.
 *
 * Arguments:
 * 0: Engineer <OBJECT>
 * 2: Item <STRING>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_engineer", "_item", "_return","_crew"];
_engineer = _this select 0;
_item = _this select 1;

if ([_engineer, _item] call EFUNC(common,hasItem)) exitwith {
    [[_engineer, _item], QUOTE(EFUNC(common,useItem)), _engineer] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
    [true, _engineer];
};
[false, objNull];
