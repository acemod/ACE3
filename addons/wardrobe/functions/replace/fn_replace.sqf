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

#define DISTANCE 50

params ["_target", "_player", "_actionParams"];
_actionParams params ["_cfg_origin", "_cfg_tgt"];


[ _player, getText (_cfg_tgt >> Q(ADDON) >> "gesture") ] call ace_common_fnc_doGesture;

private _typeNumber = getNumber (_cfg_origin >> "ItemInfo" >> "type");

private _additionalParams = "";

private _replaceCode = switch ( _typeNumber ) do {
    case TYPE_GOGGLE:   {                                 FUNC(replace_facewear) };
    case TYPE_HEADGEAR: {                                 FUNC(replace_headgear) };
    case TYPE_UNIFORM:  { _additionalParams = "UNIFORM";  FUNC(replace_uniform)  };
    case TYPE_VEST:     { _additionalParams = "VEST";     FUNC(replace_uniform)  };
    case TYPE_BACKPACK: { _additionalParams = "BACKPACK"; FUNC(replace_uniform)  };
};

private _duration     = getNumber (_cfg_tgt>> Q(ADDON) >> "duration");
// Plays Random Sound At the Beginning
private _sound = [_cfg_tgt >> Q(ADDON) >> "sound"] call FUNC(getCfgDataRandom);
private _sound_timing = getNumber (_cfg_tgt>> Q(ADDON) >> "sound_timing") max 0 min 1;

private _params_soundEnd = false;

if (_sound != "") then {
    if  (_sound_timing < 1) then {
        [
            CBA_fnc_globalEvent ,
            [QGVAR(EH_say3d), [_player, _sound]],
            _sound_timing * _duration
        ] call CBA_fnc_waitAndExecute;
    } else {
        _params_soundEnd = [ QGVAR(EH_say3d), [ _player, _sound] ];
    };
};

private _notify_img = getText (_cfg_tgt >> "picture");
if !(".paa" in _notify_img) then { _notify_img = [_notify_img,"paa"] joinString "." };

private _params_notify = [[ _notify_img, 4], [getText (_cfg_tgt >> "displayName")], true ];
private _params_replace = [_player, _cfg_origin, _cfg_tgt, _additionalParams ];

// Dart made a PR to CBA to impove depricated Functions. I plan to use these once cba gets updated.
// [ [ _player ], [ _sound, 50 ] ] call CBA_fnc_globalSay;

if ( _duration > 1 ) then {

    [
        _duration               // * 0: Total Time (in game "time" seconds) <NUMBER>
        ,[_replaceCode, _params_replace, _params_soundEnd, _params_notify] // * 1: Arguments, passed to condition, fail and finish <ARRAY>
        // * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
        ,{
            params ["_args", "_elapsedTime", "_totalTime", "_errorCode"];
            _args params ["_replaceCode", "_params_replace", "_params_soundEnd", "_params_notify"];

            _params_replace call _replaceCode;
            _params_notify call CBA_fnc_notify;
            if (_params_soundEnd isNotEqualTo false) then { _params_soundEnd call CBA_fnc_globalEvent; };
        }
        // * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
        ,{}   
        ,""                     // * 4: Localized Title <STRING> (default: "")
    ] call ace_common_fnc_progressBar;

} else {
    [ _replaceCode,        _params_replace,  _duration * 1.0 ] call CBA_fnc_waitAndExecute;
    [ CBA_fnc_notify,      _params_notify,   _duration * 1.2 ] call CBA_fnc_waitAndExecute;
    if (_params_soundEnd isNotEqualTo false) then { [ CBA_fnc_globalEvent, _params_soundEnd, _duration * 1.0 ] call CBA_fnc_waitAndExecute; };
};