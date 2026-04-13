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


// PREP
private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

private _typeOrigin = _cfgOrigin call LINKFUNC(getTypeNumber);
private _typeTarget = _cfgTarget call LINKFUNC(getTypeNumber);

// Duration of Animationphase
private _duration = _actionParams call LINKFUNC(getDuration);


private _replaceCode = GVAR(replaceHashmap) get _typeOrigin;


// FAIL CONDITIONS
private _isNotEqualTypeNumber = _typeOrigin isNotEqualTo _typeTarget;

if (isNil "_replaceCode") exitWith { ERROR_2("typeNumber undefined: %1 - %2",_typeOrigin,_classOrigin); };
if (_isNotEqualTypeNumber && { _typeTarget in [TYPE_UNIFORM, TYPE_VEST, TYPE_BACKPACK] }) exitWith {
    ERROR_4("Convertion of containers not supported: %1: %2 -> %3: %4",_classOrigin,_typeOrigin,_classTarget,_typeTarget)
};
if (_isNotEqualTypeNumber && {
        switch (_typeTarget) do {
            case TYPE_HEADGEAR: { "" isNotEqualTo headgear _player };
            case TYPE_GOGGLE:   { "" isNotEqualTo goggles _player };
            case TYPE_HMD:      { "" isNotEqualTo hmd _player };
        }
    }
) exitWith { [ [LLSTRING(slotOccupied), _typeTarget call LINKFUNC(getSlotName)], 2 ] call EFUNC(common,displayTextStructured); };

// REPLACE MECHANIC
// Disables Wardrobe Action temporarily
GVAR(inProgress) = true;

// use hashmap instead of array to futureproofing - espl. regarding API Events - extended data can simply be added
private _replaceData = createHashMapFromArray [
    ["player", _player],
    ["classOrigin", _classOrigin],
    ["classTarget", _classTarget],
    ["typeOrigin", _typeOrigin],
    ["typeTarget", _typeTarget]
];

private _extendedInfo = createHashMap;
[QGVAR(itemChangedStart), [_replaceData, _extendedInfo]] call CBA_fnc_localEvent; // API

[{
    params ["_replaceData", "_replaceCode", "_extendedInfo"];

    [QGVAR(itemChangedBegin), [_replaceData, _extendedInfo]] call CBA_fnc_localEvent; // API
    _replaceData call _replaceCode;
    [QGVAR(itemChangedEnd), [_replaceData, _extendedInfo]] call CBA_fnc_localEvent; // API

}, [_replaceData, _replaceCode, _extendedInfo], _duration] call CBA_fnc_waitAndExecute;


// HANDLE COMPONENTS
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


// EFFECTS
// animation/gestures
[_player, _actionParams call LINKFUNC(getGesture)] call EFUNC(common,doGesture);

// Soundseffects
private _sound = _actionParams call LINKFUNC(getSound);
if (_sound isNotEqualTo "") then {
    [
        CBA_fnc_globalSay3D,
        [_player, _sound, nil, true, true],
        _duration * ( _actionParams call LINKFUNC(getSoundTiming) )
    ] call CBA_fnc_waitAndExecute;
};

// Notification
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
