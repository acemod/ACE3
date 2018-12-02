#include "script_component.hpp"
/*
 * Author: commy2, Glowbal, PabstMirror
 * Modified by Salbei
 * Draw progress bar and execute given function if succesful.
 * Finish/Failure/Conditional are all passed [_args, _errorCode]
 *
 * Arguments:
 * 0: Arguments, passed to condition, fail and finish <ARRAY>
 * 1: On Finish: Code called or STRING raised as event. <CODE, STRING>
 * 2: On Failure: Code called or STRING raised as event. <CODE, STRING>
 * 3: (Optional) Localized Title <STRING>
 * 4: Code to check each frame (Optional) <CODE>
 * 5: Exceptions for checking EFUNC(common,canInteractWith) (Optional)<ARRAY>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */

params ["_args", "_onFinish", "_onFail", ["_localizedTitle", ""], ["_condition", {true}], ["_exceptions", []]];

private _player = ACE_player;

//Open Dialog and set the title
closeDialog 0;
createDialog QEGVAR(common,ProgressBar_Dialog);

(uiNamespace getVariable QEGVAR(common,ctrlProgressBarTitle)) ctrlSetText _localizedTitle;

//Adjust position based on user setting:
private _ctrlPos = ctrlPosition (uiNamespace getVariable QEGVAR(common,ctrlProgressBarTitle));
_ctrlPos set [1, ((0 + 29 * ace_common_settingProgressBarLocation) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))];

(uiNamespace getVariable QEGVAR(common,ctrlProgressBG)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QEGVAR(common,ctrlProgressBG)) ctrlCommit 0;
(uiNamespace getVariable QEGVAR(common,ctrlProgressBar)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QEGVAR(common,ctrlProgressBar)) ctrlCommit 0;
(uiNamespace getVariable QEGVAR(common,ctrlProgressBarTitle)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QEGVAR(common,ctrlProgressBarTitle)) ctrlCommit 0;

[{
    (_this select 0) params ["_args", "_onFinish", "_onFail", "_condition", "_player", "_exceptions"];
    _args params ["", "_trench", ["_finishCondition", true]];
    private _progress = _trench getVariable [QGVAR(progress), 0];

    private _errorCode = -1;

    // this does not check: target fell unconscious, target died, target moved inside vehicle / left vehicle, target moved outside of players range, target moves at all.
    if (isNull (uiNamespace getVariable [QEGVAR(common,ctrlProgressBar), controlNull])) then {
        _errorCode = 1;
    } else {
        if (ACE_player != _player || !alive _player) then {
            _errorCode = 2;
        } else {
            if !([_args, _errorCode] call _condition) then {
                _errorCode = 3;
            } else {
                if !([_player, objNull, _exceptions] call EFUNC(common,canInteractWith)) then {
                    _errorCode = 4;
                } else {
                    if (_finishCondition && _progress >= 1) then {
                        _errorCode = 0;
                    } else {
                       if (!(_finishCondition) && _progress <= 0) then {
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
        if (!isNull (uiNamespace getVariable [QEGVAR(common,ctrlProgressBar), controlNull])) then {
            closeDialog 0;
        };

        [_this select 1] call CBA_fnc_removePerFrameHandler;

        if (_errorCode == 0) then {
            if (_onFinish isEqualType "") then {
                [_onFinish, [_args, _errorCode]] call CBA_fnc_localEvent;
            } else {
                [_args, _errorCode] call _onFinish;
            };
        } else {
            if (_onFail isEqualType "") then {
                [_onFail, [_args, _errorCode]] call CBA_fnc_localEvent;
            } else {
                [_args, _errorCode] call _onFail;
            };
        };
    } else {
        //Update Progress Bar
        (uiNamespace getVariable QEGVAR(common,ctrlProgressBar)) progressSetPosition _progress;
    };
}, 0, [_args, _onFinish, _onFail, _condition, _player, _exceptions]] call CBA_fnc_addPerFrameHandler;
