#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Removes the modifiable item and replaces it with the target item.
 *
 * Arguments:
 * 0: Target (not used) <OBJECT>
 * 1: Player <OBJECT>
 * 2: Action params <ARRAY of CONFIGs>
 * - 0: Current variant <CONFIG>
 * - 1: Desired variant <CONFIG>
 *
 * Return Value:
 * None
 *
 * Example:
 * [nil, player, [configFile >> "CfgWeapons" >> "U_B_CTRG_1", configFile >> "CfgWeapons" >> "U_B_CTRG_3"]] call ace_wardrobe_fnc_replace
 *
 * Public: No
 */

params ["", "_player", "_actionParams"];
_actionParams params ["_cfgOrigin", "_cfgTarget"];

private _classTarget = configName _cfgTarget;
private _classOrigin = configName _cfgOrigin;
private _cfgWardobeTarget = configFile >> QUOTE(ADDON) >> _classTarget;

// duration of the "animation"
private _duration = getNumber (_cfgWardobeTarget >> "duration");

// replace the main Item
private _equipmentType = "";
private _typeNumber = getNumber (_cfgOrigin >> "ItemInfo" >> "type");
private _replaceCode = switch (_typeNumber) do {
    case TYPE_HEADGEAR: { _equipmentType = "HEADGEAR"; LINKFUNC(replaceOther) };
    case TYPE_UNIFORM:  { _equipmentType = "UNIFORM";  LINKFUNC(replaceContainer) };
    case TYPE_VEST:     { _equipmentType = "VEST";     LINKFUNC(replaceContainer) };
    case TYPE_BACKPACK: { _equipmentType = "BACKPACK"; LINKFUNC(replaceContainer) };
    default {
        // CfgGlasses items do not have a ItemInfo subclass and therefore, not typeNumber
        switch (true) do {
            case (isClass (configFile >> "CfgGlasses" >> _classOrigin)): { _equipmentType = "FACEWEAR"; LINKFUNC(replaceOther) };
            default { {} };
        };
    };
};
if (_replaceCode isEqualTo {}) exitWith { ERROR_2("typeNumber undefined: %1 - %2",_typeNumber,_classOrigin); };

private _extendedInfo = createHashMap;
[QGVAR(itemChangedStart), [_player, _classOrigin, _classTarget, _equipmentType, _extendedInfo]] call CBA_fnc_localEvent;

// temp action disabled
GVAR(inProgress) = true;

[{
    params ["_player", "_classOrigin", "_classTarget", "_equipmentType", "_replaceCode", "_extendedInfo"];

    [QGVAR(itemChangedBegin), [_player, _classOrigin, _classTarget, _equipmentType, _extendedInfo]] call CBA_fnc_localEvent;

    [_player, _classTarget, _equipmentType] call _replaceCode;

    [QGVAR(itemChangedEnd), [_player, _classOrigin, _classTarget, _equipmentType, _extendedInfo]] call CBA_fnc_localEvent;

}, [_player, _classOrigin, _classTarget, _equipmentType, _replaceCode, _extendedInfo], _duration] call CBA_fnc_waitAndExecute;

// handle components
[_classOrigin, _classTarget] call FUNC(compareComponents) params ["_missing", "_surplus"];

// add surplus
{
    if (_classTarget isNotEqualTo _x) then {
        if (goggles _player isEqualTo "" && { isClass (configFile >> "CfgGlasses" >> _x) }) then {
            _player addGoggles _x;
        } else {
            [_player, _x, true] call CBA_fnc_addItem;
        };
    };
} forEach _surplus;

// remove missing
{
    if (_classOrigin isNotEqualTo _x) then {
        if (goggles _player isEqualTo _x) then {
            removeGoggles _player;
        } else {
            [_player, _x] call CBA_fnc_removeItem;
        };
    };
} forEach _missing;

// handle effects
// animation/gestures
[_player, getText (_cfgWardobeTarget >> "gesture")] call EFUNC(common,doGesture);

// plays random sound at the beginning
private _sound = [_cfgWardobeTarget >> "sound"] call CBA_fnc_getCfgDataRandom;
if (_sound isNotEqualTo "") then {
    [
        CBA_fnc_globalSay3D,
        [_player, _sound, nil, true, true],
        (getNumber (_cfgWardobeTarget >> "sound_timing") max 0 min 1) * _duration
    ] call CBA_fnc_waitAndExecute;
};

// notification
private _imgNotify = getText (_cfgTarget >> "picture");
if !(".paa" in _imgNotify) then {
    // some vanilla items dont have the .paa and cba notify will display the path as a string without the .paa
    _imgNotify = _imgNotify + ".paa"
};

[
    EFUNC(common,displayTextStructured),
    [["<img image='%1' size=5></img><br/>%2", _imgNotify, getText (_cfgTarget >> "displayName")], 4],
    _duration * 1.2
] call CBA_fnc_waitAndExecute;

nil
