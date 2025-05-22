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
_actionParams params ["_cfgOrigin", "_cfgTarget"];

// Duration of the "animation"
private _duration = getNumber (configFile >> QUOTE(ADDON) >> configName _cfgTarget >> "duration");
if (_replaceNow) then { _duration = 0; }; // needed for cba context menu - avoid potential duplications and such

// Replace the Main Item.
private _additionalParams = "";
private _typeNumber = getNumber (_cfgOrigin >> "ItemInfo" >> "type");
private _replaceCode = switch ( _typeNumber ) do {
    case TYPE_HEADGEAR: { _additionalParams = "HEADGEAR"; FUNC(replaceOther) };
    case TYPE_UNIFORM:  { _additionalParams = "UNIFORM";  FUNC(replaceContainer)  };
    case TYPE_VEST:     { _additionalParams = "VEST";     FUNC(replaceContainer)  };
    case TYPE_BACKPACK: { _additionalParams = "BACKPACK"; FUNC(replaceContainer)  };
    default {
        // CfgGlasses items do not have a ItemInfo Subclass and therefore, not TypeNumber.
        switch (true) do {
            case (isClass (configFile >> "CfgGlasses" >> configName _cfgOrigin)): { _additionalParams = "FACEWEAR"; FUNC(replaceOther) };
            default { false };
        };
    };
};

if (_replaceCode isEqualType false) exitWith { ERROR_2("typeNumber undefined: %1 - %2",_typeNumber,configName _cfgOrigin); };
[ _replaceCode, [_unit, _cfgOrigin, _cfgTarget, _additionalParams ], _duration] call CBA_fnc_waitAndExecute;

//// Handle Components
// Add Surplus
[_cfgOrigin, _cfgTarget] call FUNC(compareComponents) params ["_missing", "_surplus"];
{
    if (configName _cfgTarget isNotEqualTo _x) then {
        if ( isClass (configFile >> "CfgGlasses" >> _x) && { goggles _unit isEqualTo "" } ) then {
            _unit addGoggles _x;
        } else {
            [_unit, _x, true] call CBA_fnc_addItem;
        };
    };
} forEach _surplus;   

// Remove Missing
{
    if (configName _cfgOrigin isNotEqualTo _x) then {

        switch (true) do {
            case (goggles _unit isEqualTo _x): { removeGoggles _unit; };
            default { [_unit, _x] call CBA_fnc_removeItem; };
        };
    };
} forEach _missing;


//// Handle Effects
// Animation/Gestures
[ _unit, getText (configFile >> QUOTE(ADDON) >> configName _cfgTarget >> "gesture") ] call EFUNC(common,doGesture);

// Plays Random Sound At the Beginning
private _sound = [configFile >> QUOTE(ADDON) >> configName _cfgTarget >> "sound"] call CBA_fnc_getCfgDataRandom;
if (_sound isNotEqualTo "") then {
    [
        CBA_fnc_globalSay3D,
        [_unit, _sound, nil, true, true],
        (getNumber (configFile >> QUOTE(ADDON) >> configName _cfgTarget >> "sound_timing") max 0 min 1) * _duration
    ] call CBA_fnc_waitAndExecute;
};

// Notification
private _imgNotify = getText (_cfgTarget >> "picture");
if !(".paa" in _imgNotify) then { _imgNotify = [_imgNotify, "paa"] joinString "." }; // Some vanilla items dont have the .paa and cba notify will display the path as a string without the .paa
[EFUNC(common,displayTextStructured), [["<img image='%1' size=5></img><br/>%2", _imgNotify, getText (_cfgTarget >> "displayName")], 4], _duration * 1.2] call CBA_fnc_waitAndExecute;

nil
