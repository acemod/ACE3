#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Ace action statement. Removes the modifiableItem and replaces it with the target item.
 *
 * Arguments:
 * 0: Action target <OBJECT>
 * 1: Action player <OBJECT>
 * 2: Action params <ARRAY>
 * - 0: Current variant <CONFIG>
 * - 0: Desired variant <CONFIG>
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

params ["", "_unit", "_actionParams", ["_replaceNow", false, [true]]];
_actionParams params ["_cfgOrigin", "_cfgTarget"];

private _classTarget = configName _cfgTarget;
private _classOrigin = configName _cfgOrigin;

// duration of the "animation"
private _duration = getNumber (configFile >> QUOTE(ADDON) >> _classTarget >> "duration");
if (_replaceNow) then { _duration = 0; }; // needed for cba context menu - avoid potential duplications and such

// replace the main Item
private _equipmentType = "";
private _typeNumber = getNumber (_cfgOrigin >> "ItemInfo" >> "type");
private _replaceCode = switch ( _typeNumber ) do {
    case TYPE_HEADGEAR: { _equipmentType = "HEADGEAR"; FUNC(replaceOther) };
    case TYPE_UNIFORM:  { _equipmentType = "UNIFORM";  FUNC(replaceContainer)  };
    case TYPE_VEST:     { _equipmentType = "VEST";     FUNC(replaceContainer)  };
    case TYPE_BACKPACK: { _equipmentType = "BACKPACK"; FUNC(replaceContainer)  };
    default {
        // CfgGlasses items do not have a ItemInfo subclass and therefore, not typeNumber
        switch (true) do {
            case (isClass (configFile >> "CfgGlasses" >> _classOrigin)): { _equipmentType = "FACEWEAR"; FUNC(replaceOther) };
            default { {} };
        };
    };
};

if (_replaceCode isEqualTo {}) exitWith { ERROR_2("typeNumber undefined: %1 - %2",_typeNumber,_classOrigin); };
[ _replaceCode, [_unit, _cfgTarget, _equipmentType ], _duration] call CBA_fnc_waitAndExecute;

// handle components
[_cfgOrigin, _cfgTarget] call FUNC(compareComponents) params ["_missing", "_surplus"];

// add surplus
{
    if (_classTarget isNotEqualTo _x) then {
        if ( isClass (configFile >> "CfgGlasses" >> _x) && { goggles _unit isEqualTo "" } ) then {
            _unit addGoggles _x;
        } else {
            [_unit, _x, true] call CBA_fnc_addItem;
        };
    };
} forEach _surplus;   

// remove missing
{
    if (_classOrigin isNotEqualTo _x) then {
        switch (true) do {
            case (goggles _unit isEqualTo _x): { removeGoggles _unit; };
            default { [_unit, _x] call CBA_fnc_removeItem; };
        };
    };
} forEach _missing;

// handle effects
// animation/gestures
[ _unit, getText (configFile >> QUOTE(ADDON) >> _classTarget >> "gesture") ] call EFUNC(common,doGesture);

// plays random sound at the beginning
private _sound = [configFile >> QUOTE(ADDON) >> _classTarget >> "sound"] call CBA_fnc_getCfgDataRandom;
if (_sound isNotEqualTo "") then {
    [
        CBA_fnc_globalSay3D,
        [_unit, _sound, nil, true, true],
        (getNumber (configFile >> QUOTE(ADDON) >> _classTarget >> "sound_timing") max 0 min 1) * _duration
    ] call CBA_fnc_waitAndExecute;
};

// notification
private _imgNotify = getText (_cfgTarget >> "picture");
if !(".paa" in _imgNotify) then { _imgNotify = _imgNotify + ".paa" }; // some vanilla items dont have the .paa and cba notify will display the path as a string without the .paa
[EFUNC(common,displayTextStructured), [["<img image='%1' size=5></img><br/>%2", _imgNotify, getText (_cfgTarget >> "displayName")], 4], _duration * 1.2] call CBA_fnc_waitAndExecute;

nil
