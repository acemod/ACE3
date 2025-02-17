#include "..\script_component.hpp"
#include "\a3\ui_f\hpp\defineDIKCodes.inc"
/*
 * Author: commy2, Glowbal, PabstMirror
 * Draw progress bar and execute given function if succesful.
 * Finish/Failure/Conditional are all passed [_args, _elapsedTime, _totalTime, _errorCode]
 *
 * Arguments:
 * 0: Total Time (in game "time" seconds) <NUMBER>
 * 1: Arguments, passed to condition, fail and finish <ARRAY>
 * 2: On Finish: Code called or STRING raised as event. <CODE, STRING>
 * 3: On Failure: Code called or STRING raised as event. <CODE, STRING>
 * 4: Localized Title <STRING> (default: "")
 * 5: Code to check each frame <CODE> (default: {true})
 * 6: Exceptions for checking ace_common_fnc_canInteractWith <ARRAY> (default: [])
 * 7: Create progress bar as dialog, this blocks user input <BOOL> (default: true)
 *
 * Return Value:
 * None
 *
 * Example:
 * [5, [], {Hint "Finished!"}, {hint "Failure!"}, "My Title"] call ace_common_fnc_progressBar
 *
 * Public: Yes
 */

params ["_totalTime", "_args", "_onFinish", "_onFail", ["_localizedTitle", ""], ["_condition", {true}], ["_exceptions", []], ["_dialog", true]];

private _player = ACE_player;

//Open Dialog and set the title
closeDialog 0;
if (_dialog) then {
    createDialog QGVAR(ProgressBar_Dialog);
} else {
    QGVAR(progressBarDisplay) cutRsc [QGVAR(ProgressBar_Display), "PLAIN"];
};

private _display = uiNamespace getVariable QGVAR(dlgProgress);

// Ensure CBA keybindings are hooked into the display
_display call (uiNamespace getVariable "CBA_events_fnc_initDisplayCurator");

// Hide cursor by using custom transparent cursor
if (_dialog) then {
    private _map = _display displayCtrl 101;
    _map ctrlMapCursor ["", QGVAR(blank)];
} else { // Add key handler for ESC to cancel
    [DIK_ESCAPE, [false, false, false], {
        QGVAR(progressBarDisplay) cutText ["", "PLAIN"];
        [QGVAR(progressBarKeyHandler), "keydown"] call CBA_fnc_removeKeyHandler;
        true
    }, "keydown", QGVAR(progressBarKeyHandler)] call CBA_fnc_addKeyHandler;
};

(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetText _localizedTitle;

//Adjust position based on user setting:
private _ctrlPos = ctrlPosition (uiNamespace getVariable QGVAR(ctrlProgressBarTitle));
_ctrlPos set [1, ((0 + 29 * GVAR(settingProgressBarLocation)) * ((((safeZoneW / safeZoneH) min 1.2) / 1.2) / 25) + (safeZoneY + (safeZoneH - (((safeZoneW / safeZoneH) min 1.2) / 1.2))/2))];

(uiNamespace getVariable QGVAR(ctrlProgressBG)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QGVAR(ctrlProgressBG)) ctrlCommit 0;
(uiNamespace getVariable QGVAR(ctrlProgressBar)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QGVAR(ctrlProgressBar)) ctrlCommit 0;
(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlCommit 0;

[{
    (_this select 0) params ["_args", "_onFinish", "_onFail", "_condition", "_player", "_startTime", "_totalTime", "_exceptions", "_title", "_dialog"];

    private _elapsedTime = CBA_missionTime - _startTime;
    private _errorCode = -1;

    // this does not check: target fell unconscious, target died, target moved inside vehicle / left vehicle, target moved outside of players range, target moves at all.
    if (isNull (uiNamespace getVariable [QGVAR(ctrlProgressBar), controlNull])) then {
        _errorCode = 1;
    } else {
        if (ACE_player != _player || !alive _player) then {
            _errorCode = 2;
        } else {
            if !([_args, _elapsedTime, _totalTime, _errorCode] call _condition) then {
                _errorCode = 3;
            } else {
                if !([_player, objNull, _exceptions] call EFUNC(common,canInteractWith)) then {
                    _errorCode = 4;
                } else {
                    if (!_dialog && {dialog}) then {
                        _errorCode = 5;
                    } else {
                        if (_elapsedTime >= _totalTime) then {
                            _errorCode = 0;
                        };
                    };
                };
            };
        };
    };

    if (_errorCode != -1) then {
        //Error or Success, close dialog and remove PFEH

        //Only close dialog if it's the progressBar:
        if (!isNull (uiNamespace getVariable [QGVAR(ctrlProgressBar), controlNull])) then {
            if (_dialog) then {
                closeDialog 0;
            } else {
                QGVAR(progressBarDisplay) cutText ["", "PLAIN"];
                // Remove key handler for non-dialog bar
                [QGVAR(progressBarKeyHandler), "keydown"] call CBA_fnc_removeKeyHandler;
            };
        };

        [_this select 1] call CBA_fnc_removePerFrameHandler;

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
        //Update Progress Bar (ratio of elepased:total)
        private _ratio = _elapsedTime / _totalTime;
        (uiNamespace getVariable QGVAR(ctrlProgressBar)) progressSetPosition _ratio;
        switch (GVAR(progressBarInfo)) do {
            case 0: {};
            case 1: {
                (uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetText (_title + format [" (%1", floor (_ratio * 100)] + "%)");
            };
            case 2: {
                (uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetText (_title + " " + format [localize LSTRING(TimeLeft), ceil (_totalTime - _elapsedTime)]);
            };
        };
    };
}, 0, [_args, _onFinish, _onFail, _condition, _player, CBA_missionTime, _totalTime, _exceptions, _localizedTitle, _dialog]] call CBA_fnc_addPerFrameHandler;
