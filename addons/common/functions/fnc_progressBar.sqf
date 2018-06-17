/*
 * Author: commy2, Glowbal, PabstMirror, mharis001
 * Creates a progress and executes given functions on success or failure.
 * Finish, fail, and condition are all passed [_args, _elapsedTime, _totalTime, _errorCode].
 *
 * Arguments:
 * 0: Total Time (in-game "time" seconds) <NUMBER>
 * 1: Arguments passed to finish, fail, and condition code <ARRAY>
 * 2: On Finish: code called or STRING raised as event <CODE|STRING>
 * 3: On Failure: code called or STRING raised as event <CODE|STRING>
 * 4: Localized title <STRING> (default: "")
 * 5: Condition: code to check each frame <CODE> (default: {true})
 * 6: Exceptions for checking EFUNC(common,canInteractWith) <ARRAY> (default: [])
 *
 * Return Value:
 * None
 *
 * Example:
 * [5, [], {hint "Finished!"}, {hint "Failure!"}, "My Title"] call ace_common_fnc_progressBar
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_totalTime", "_args", "_onFinish", "_onFail", ["_localizedTitle", ""], ["_condition", {true}], ["_exceptions", []]];

private _player = ACE_player;

// Create the progress bar dialog and set the title
closeDialog 0;
createDialog QGVAR(progressBarDialog);
GETUVAR(GVAR(progressTitle),controlNull) ctrlSetText _localizedTitle;

[{
    (_this select 0) params ["_args", "_onFinish", "_onFail", "_condition", "_player", "_startTime", "_totalTime", "_exceptions"];

    private _progressBar = GETUVAR(GVAR(progressBar),controlNull);
    private _elapsedTime = CBA_missionTime - _startTime;
    private _errorCode = -1;

    // Check for errors (or success), this does not check if target:
    // - died or went unconscious
    // - moved inside or left vehicle
    // - moved outside of the player's range
    // - moved at all
    if (isNull _progressBar) then {
        _errorCode = 1;
    } else {
        if !(_player isEqualTo ACE_player && {alive _player}) then {
            _errorCode = 2;
        } else {
            if !([_args, _elapsedTime, _totalTime, _errorCode] call _condition) then {
                _errorCode = 3;
            } else {
                if !([_player, objNull, _exceptions] call EFUNC(common,canInteractWith)) then {
                    _errorCode = 4;
                } else {
                    if (_elapsedTime >= _totalTime) then {
                        _errorCode = 0;
                    };
                };
            };
        };
    };

    if (_errorCode != -1) then {
        // Error or success, remove PFH and close dialog if its still open
        [_this select 1] call CBA_fnc_removePerFrameHandler;
        if (!isNull _progressBar) then {closeDialog 0};

        if (_errorCode == 0) then {
            if (_onFinish isEqualType "") then {
                [_onFinish, [_args, _elapsedTime, _totalTime, _errorCode]] call CBA_fnc_localEvent;
            } else {
                [_args, _elapsedTime, _totalTime, _errorCode] call _onFinish;
            };
        } else {
            if (_onFail isEqualType "") then {
                [_onFail, [_args, _elapsedTime, _totalTime, _errorCode]] call CBA_fnc_localEvent;
            } else {
                [_args, _elapsedTime, _totalTime, _errorCode] call _onFail;
            };
        };
    } else {
        // Update progress bar's position (ratio of elepased:total)
        private _progress = _elapsedTime / _totalTime;
        _progressBar progressSetPosition _progress;
        if (GVAR(colorfulProgressBar)) then {
            _progressBar ctrlSetTextColor [2 * (1 - _progress), 2 * _progress, 0, 0.8];
        };
    };
}, 0, [_args, _onFinish, _onFail, _condition, _player, CBA_missionTime, _totalTime, _exceptions]] call CBA_fnc_addPerFrameHandler;
