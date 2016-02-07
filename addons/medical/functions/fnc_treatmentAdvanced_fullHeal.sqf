/**
 * fn_heal.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_target", "_caller", "_selectionName", "_className", "_items"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

if (local _target) then {
    ["treatmentAdvanced_fullHealLocal", [_caller, _target]] call EFUNC(common,localEvent);
} else {
    ["treatmentAdvanced_fullHealLocal", _target, [_caller, _target]] call EFUNC(common,targetEvent);
};

true;
