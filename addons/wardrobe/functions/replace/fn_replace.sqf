#include "../../script_component.hpp"

/*
* Author: Zorn
* function to removes the modifiableItem and replaces it with the target item
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

params ["_target", "_unit", "_actionParams", ["_replaceNow", false, [true]]];
_actionParams params ["_cfg_origin", "_cfg_tgt"];

// Duration of the "animation"
private _duration = getNumber (_cfg_tgt>> Q(ADDON) >> "duration");
if (_replaceNow) then { _duration = 0; };

// Animation/Gestures
[ _unit, getText (_cfg_tgt >> Q(ADDON) >> "gesture") ] call ace_common_fnc_doGesture;


// Remove / Add Missing/Surplus Items.
[_cfg_origin, _cfg_tgt] call FUNC(compare_components) params ["_missing", "_surplus"];
{ [_unit, _x, true] call CBA_fnc_addItem; } forEach _surplus;
{ [_unit, _x] call CBA_fnc_removeItem;    } forEach _missing;


// Replace the Main Item.
private _additionalParams = "";
private _replaceCode = switch ( getNumber (_cfg_origin >> "ItemInfo" >> "type") ) do {
    case TYPE_GOGGLE:   {                                 FUNC(replace_facewear) };
    case TYPE_HEADGEAR: {                                 FUNC(replace_headgear) };
    case TYPE_UNIFORM:  { _additionalParams = "UNIFORM";  FUNC(replace_uniform)  };
    case TYPE_VEST:     { _additionalParams = "VEST";     FUNC(replace_uniform)  };
    case TYPE_BACKPACK: { _additionalParams = "BACKPACK"; FUNC(replace_uniform)  };
};
[ _replaceCode,        [_unit, _cfg_origin, _cfg_tgt, _additionalParams ],  _duration * 1.0 ] call CBA_fnc_waitAndExecute;


// Plays Random Sound At the Beginning
private _sound_timing = getNumber (_cfg_tgt>> Q(ADDON) >> "sound_timing") max 0 min 1;
private _sound = [_cfg_tgt >> Q(ADDON) >> "sound"] call FUNC(getCfgDataRandom);
if (_sound != "") then { [ CBA_fnc_globalEvent, [QGVAR(EH_say3d), [_unit, _sound]], _sound_timing * _duration ] call CBA_fnc_waitAndExecute; };


// Notification
private _notify_img = getText (_cfg_tgt >> "picture");
if !(".paa" in _notify_img) then { _notify_img = [_notify_img,"paa"] joinString "." };
[ CBA_fnc_notify,      [[ _notify_img, 4], [getText (_cfg_tgt >> "displayName")], true ],   _duration * 1.2 ] call CBA_fnc_waitAndExecute;


