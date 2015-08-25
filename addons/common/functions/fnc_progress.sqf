/*
 * Author: commy2, Glowbal, PabstMirror, ArcticSnowSky
 *
 * Execute given function if succesful.
 * Aligned to progressBar but without references to UI or player
 * Finish/Failure/Conditional are all passed [_args, _elapsedTime, _totalTime, _errorCode]
 *
 * Argument:
 * 0: NUMBER - Total Time (in game "ACE_time" seconds)
 * 1: ARRAY - Arguments, passed to condition, fail and finish
 * 2: CODE or STRING - On Finish: Code called or STRING raised as event.
 * 3: CODE or STRING - On Failure: Code called or STRING raised as event.
 * 4: UNIT - (Optional) The unit that makes the progress
 * 5: OBJECT - (Optional) The object the progress relates to
 * 4: CODE - (Optional) Code to check each frame
 * 5: ARRAY - (Optional) Exceptions for checking EFUNC(common,canInteractWith)
 *
 * Return value:
 * Nothing
 *
 * Example:
 * [5, [], {Hint "Finished!"}, {hint "Failure!"}] call ace_common_fnc_progress
 */

#include "script_component.hpp"

PARAMS_4(_totalTime,_args,_onFinish,_onFail);
DEFAULT_PARAM(4,_caller,{objNull});
DEFAULT_PARAM(5,_target,{objNull});
DEFAULT_PARAM(6,_condition,{true});
DEFAULT_PARAM(7,_exceptions,[]);
private ["_caller", "_target", "_perFrameFunction"];



_perFrameFunction = {
    PARAMS_2(_parameters,_pfhID);
    EXPLODE_9_PVT(_parameters,_args,_onFinish,_onFail,_condition,_caller,_target,_startTime,_totalTime,_exceptions);
    private ["_elapsedTime", "_errorCode"];

    _elapsedTime = ACE_time - _startTime;
    _errorCode = -1;

    // this does not check: target fell unconscious, target died, target moved inside vehicle / left vehicle, target moved outside of players range, target moves at all.
    if (!isNull _caller && !alive _caller) then {
        _errorCode = 2;
    } else {
        if (!([_args, _elapsedTime, _totalTime, _errorCode] call _condition)) then {
            _errorCode = 3;
        } else {
            if (!([_caller, _target, _exceptions] call EFUNC(common,canInteractWith))) then {
                _errorCode = 4;
            } else {
                if (_elapsedTime >= _totalTime) then {
                    _errorCode = 0;
                };
            };
        };
    };

    if (_errorCode != -1) then {
        //Error or Success, close dialog and remove PFEH

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
    };
};

[_perFrameFunction, 0, [_args, _onFinish, _onFail, _condition, _caller, _target, ACE_time, _totalTime, _exceptions]] call CBA_fnc_addPerFrameHandler;
