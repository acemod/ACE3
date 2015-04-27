/*
 * Author: commy2, Glowbal, PabstMirror
 *
 * Draw progress bar and execute given function if succesful.
 * Finish/Failure/Conditional are all passed [_args, _elapsedTime, _totalTime, _errorCode]
 *
 * Argument:
 * 0: NUMBER - Total Time (in game "time" seconds)
 * 1: ARRAY - Arguments, passed to condition, fail and finish
 * 2: CODE or STRING - On Finish: Code called or STRING raised as event.
 * 3: CODE or STRING - On Failure: Code called or STRING raised as event.
 * 4: STRING - (Optional) Localized Title
 * 5: CODE - (Optional) Code to check each frame
 * 6: ARRAY - (Optional) Exceptions for checking EFUNC(common,canInteractWith)
 *
 * Return value:
 * Nothing
 *
 * Example:
 * [5, [], {Hint "Finished!"}, {hint "Failure!"}, "My Title"] call ace_common_fnc_progressBar
 */

#include "script_component.hpp"

PARAMS_4(_totalTime,_args,_onFinish,_onFail);
DEFAULT_PARAM(4,_localizedTitle,"");
DEFAULT_PARAM(5,_condition,{true});
DEFAULT_PARAM(6,_exceptions,[]);
private ["_player", "_perFrameFunction", "_ctrlPos"];

_player = ACE_player;

//Open Dialog and set the title
closeDialog 0;
createDialog QGVAR(ProgressBar_Dialog);
(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetText _localizedTitle;

//Adjust position based on user setting:
_ctrlPos = ctrlPosition (uiNamespace getVariable QGVAR(ctrlProgressBarTitle));
_ctrlPos set [1, ((0 + 29 * GVAR(SettingProgressBarLocation)) * ((((safezoneW / safezoneH) min 1.2) / 1.2) / 25) + (safezoneY + (safezoneH - (((safezoneW / safezoneH) min 1.2) / 1.2))/2))];

(uiNamespace getVariable QGVAR(ctrlProgressBG)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QGVAR(ctrlProgressBG)) ctrlCommit 0;
(uiNamespace getVariable QGVAR(ctrlProgressBar)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QGVAR(ctrlProgressBar)) ctrlCommit 0;
(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetPosition _ctrlPos;
(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlCommit 0;



_perFrameFunction = {
    PARAMS_2(_parameters,_pfhID);
    EXPLODE_8_PVT(_parameters,_args,_onFinish,_onFail,_condition,_player,_startTime,_totalTime,_exceptions);
    private ["_elapsedTime", "_errorCode"];

    _elapsedTime = time - _startTime;
    _errorCode = -1;

    // this does not check: target fell unconscious, target died, target moved inside vehicle / left vehicle, target moved outside of players range, target moves at all.
    if (isNull (uiNamespace getVariable [QGVAR(ctrlProgressBar), controlNull])) then {
        _errorCode = 1;
    } else {
        if (ACE_player != _player) then {
            _errorCode = 2;
        } else {
            if (!([_args, _elapsedTime, _totalTime, _errorCode] call _condition)) then {
                _errorCode = 3;
            } else {
                if (!([_player, objNull, _exceptions] call EFUNC(common,canInteractWith))) then {
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
        //Error or Success, close dialog and remove PFEH

        //Only close dialog if it's the progressBar:
        if (!isNull (uiNamespace getVariable [QGVAR(ctrlProgressBar), controlNull])) then {
            closeDialog 0;
        };
        [_pfhID] call CBA_fnc_removePerFrameHandler;

        if (_errorCode == 0) then {
            if ((typeName _onFinish) == (typeName "")) then {
                [_onFinish, [_args, _elapsedTime, _totalTime, _errorCode]] call FUNC(localEvent);
            } else {
                [_args, _elapsedTime, _totalTime, _errorCode] call _onFinish;
            };
        } else {
            if ((typeName _onFail) == (typeName "")) then {
                [_onFail, [_args, _elapsedTime, _totalTime, _errorCode]] call FUNC(localEvent);
            } else {
                [_args, _elapsedTime, _totalTime, _errorCode] call _onFail;
            };
        };
    } else {
        //Update Progress Bar (ratio of elepased:total)
        (uiNamespace getVariable QGVAR(ctrlProgressBar)) progressSetPosition (_elapsedTime / _totalTime);
    };
};

[_perFrameFunction, 0, [_args, _onFinish, _onFail, _condition, _player, time, _totalTime, _exceptions]] call CBA_fnc_addPerFrameHandler;
