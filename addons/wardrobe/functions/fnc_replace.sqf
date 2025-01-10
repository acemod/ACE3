#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * Ace Action Statement - Removes the modifiableItem and replaces it with the target item
 *
 * Arguments:
 * 0: Action Target <OBJECT>
 * 1: Action Player <OBJECT>
 * 2: Action Params <ARRAY>
 * - 0: Current Variant <CONFIG>
 * - 0: Desired Variant <CONFIG>
 * 3: Replace Now? <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_wardrobe_fnc_replace
 *
 * Public: No
 */

params ["_target", "_unit", "_actionParams", ["_replaceNow", false, [true]]];
_actionParams params ["_cfg_origin", "_cfg_tgt"];

// Duration of the "animation"
private _duration = getNumber (_cfg_tgt>> QADDON >> "duration");
if (_replaceNow) then { _duration = 0; };

// Replace the Main Item.
private _additionalParams = "";
private _typeNumber = getNumber (_cfg_origin >> "ItemInfo" >> "type");
private _replaceCode = switch ( _typeNumber ) do {
    case TYPE_HEADGEAR: { _additionalParams = "HEADGEAR"; FUNC(replace_other) };
    case TYPE_UNIFORM:  { _additionalParams = "UNIFORM";  FUNC(replace_container)  };
    case TYPE_VEST:     { _additionalParams = "VEST";     FUNC(replace_container)  };
    case TYPE_BACKPACK: { _additionalParams = "BACKPACK"; FUNC(replace_container)  };
    default {
        // CfgGlasses items do not have a ItemInfo Subclass and therefore, not TypeNumber.
        switch (true) do {
            case (isClass (configFile >> "CfgGlasses" >> configName _cfg_origin)): { _additionalParams = "FACEWEAR"; FUNC(replace_other) };
            default { false };
        };
    };
};

if (_replaceCode isEqualType false) exitWith { ERROR_2("typeNumber undefined: %1 - %2",_typeNumber,configName _cfg_origin); };
[ _replaceCode, [_unit, _cfg_origin, _cfg_tgt, _additionalParams ], _duration] call CBA_fnc_waitAndExecute;

//// Handle Components
// Add Surplus
[_cfg_origin, _cfg_tgt] call FUNC(compare_components) params ["_missing", "_surplus"];
{
    if (configName _cfg_tgt != _x) then {
        if ( isClass (configFile >> "CfgGlasses" >> _x) && { goggles _unit == "" } ) then {
            _unit addGoggles _x;
        } else {
            [_unit, _x, true] call CBA_fnc_addItem;
        };
    };
} forEach _surplus;   

// Remove Missing
{
    if (configName _cfg_origin != _x) then {

        switch (true) do {
            case (goggles _unit == _x): { removeGoggles _unit; };
            default { [_unit, _x] call CBA_fnc_removeItem; };
        };
    };
} forEach _missing;


//// Handle Effects
// Animation/Gestures
[ _unit, getText (_cfg_tgt >> QADDON >> "gesture") ] call ace_common_fnc_doGesture;

// Plays Random Sound At the Beginning
private _sound = [_cfg_tgt >> QADDON >> "sound"] call FUNC(getCfgDataRandom);
if (_sound != "") then {
    [
        CBA_fnc_globalEvent,
        [QGVAR(EH_say3d), [_unit,_sound]],
        (getNumber (_cfg_tgt>> QADDON >> "sound_timing") max 0 min 1) * _duration
    ] call CBA_fnc_waitAndExecute;
};

// Notification
private _notify_img = getText (_cfg_tgt >> "picture");
if !(".paa" in _notify_img) then { _notify_img = [_notify_img,"paa"] joinString "." };
[ CBA_fnc_notify, [[ _notify_img, 4], [getText (_cfg_tgt >> "displayName")], true ], _duration * 1.2 ] call CBA_fnc_waitAndExecute;

nil
