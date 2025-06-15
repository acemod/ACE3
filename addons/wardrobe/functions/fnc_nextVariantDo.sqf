#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Statement of cba context menu entry. Requests the next variant.
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
 * [player, nil, G_Balaclava_combat] call ace_wardrobe_fnc_nextVariantDo;
 *
 * Public: No
 */

params ["_player", "", "_item", "", ""];

private _cfgCurrent = _item call CBA_fnc_getItemConfig;

private _cfgTarget = [_cfgCurrent, _player] call FUNC(nextVariantGet);

if (_cfgTarget isEqualTo false) exitWith {};

private _canModifyTo = [_player, _cfgCurrent, _cfgTarget, false] call FUNC(canModifyTo);

if !(_canModifyTo) exitWith {
    [
        [
            LLSTRING(missingComponents),
            getText (_cfgTarget >> "displayName")
        ],
        2.5
    ] call EFUNC(common,displayTextStructured);
}; 

[_player, _player, [_cfgCurrent, _cfgTarget], true] call FUNC(replace); 

nil
