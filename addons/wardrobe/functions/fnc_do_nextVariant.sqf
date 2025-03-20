#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Statement of CBA Context Menu Entry - Request the Next Variant.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Container <OBJECT>
 * 2: Classname <STRING>
 * 3: Slot <STRING>
 * 4: Arguments <ARRAY>
 *
 * Return Value:
 * nothing
 *
 * Example:
 * [_unit, _container, _item, _slot, _params] call ace_wardrobe_fnc_do_nextVariant
 *
 * Public: No
 */

params ["_unit", "_container", "_item", "_slot", "_params"];

private _current_cfg = [_item] call cba_fnc_getItemConfig;

private _cfg_tgt = [ _current_cfg ] call FUNC(getNextVariant);

if (_cfg_tgt isEqualTo false) exitWith {};

private _canModifyTo = [_unit, _current_cfg, _cfg_tgt, false] call FUNC(canModifyTo);

if !(_canModifyTo) exitWith {
    [
        [LLSTRING(cannotSwitchTo)],
        [getText (_cfg_tgt >> "displayName")],
        [LLSTRING(missingComponents)],
        true
    ] call CBA_fnc_notify;
}; 

[_unit, _unit, [_current_cfg, _cfg_tgt], true] call FUNC(replace); 

nil
