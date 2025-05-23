#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Statement of CBA Context Menu Entry - Request the next variant.
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Container <OBJECT>
 * 2: Classname <STRING>
 * 3: Slot <STRING>
 * 4: Arguments <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit, _container, _item, _slot, _params] call ace_wardrobe_fnc_nextVariantDo;
 *
 * Public: No
 */

params ["_unit", "_container", "_item", "_slot", "_params"];

private _cfgCurrent = _item call CBA_fnc_getItemConfig;

private _cfgTarget = [ _cfgCurrent ] call FUNC(nextVariantGet);

if (_cfgTarget isEqualTo false) exitWith {};

private _canModifyTo = [_unit, _cfgCurrent, _cfgTarget, false] call FUNC(canModifyTo);

if !(_canModifyTo) exitWith {
    [
        [
            LLSTRING(missingComponents),
            getText (_cfgTarget >> "displayName")
        ],
        2.5
    ] call EFUNC(common,displayTextStructured);
}; 

[_unit, _unit, [_cfgCurrent, _cfgTarget], true] call FUNC(replace); 

nil
