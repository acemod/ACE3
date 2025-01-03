#include "../script_component.hpp"

/*
* Author: Zorn
* Function to Request the Next Variant Context Menu Action.
*
* Arguments:
*
* Return Value:
* None
*
* Example:
* ['something', player] call prefix_component_fnc_functionname
*
* Public: No
*/

params ["_unit", "_container", "_item", "_slot", "_params"];

private _current_cfg = [_item] call cba_fnc_getItemConfig;

private _cfg_tgt = [ _current_cfg ] call FUNC(getNextVariant);

if (_cfg_tgt isEqualTo false) exitWith { diag_log format ['[CVO](debug)(fn_do_nextVariant) "": %1', ""]; };

private _canModifyTo = [_unit, _current_cfg, _cfg_tgt, false] call FUNC(canModifyTo);

if !(_canModifyTo) exitWith {
    // error hint to player: cannot switch to next variant, try again
    // TODO: Stringtable XML
    [
        ["Can not switch to:"],
        [getText (_cfg_tgt >> "displayName")],
        ["missing components"],
        true
    ] call CBA_fnc_notify;
}; 


[_unit, _unit, [_current_cfg, _cfg_tgt], true] call FUNC(replace); 
