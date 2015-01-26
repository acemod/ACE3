/*
* Author: commy2, Glowbal, PabstMirror
*
* Draw progress bar and execute given function if succesful.
*
* Argument:
* 0: NUMBER - Total Time (in game "time" seconds)
* 1: ARRAY - Arguments, passed to condition, fail and finish
* 2: CODE or STRING - Finish: Code called or STRING raised as event.
* 3: CODE or STRING - Failure: Code called or STRING raised as event.
* 4: STRING - Localized Title
* 5: CODE - Code to check each frame
*
* Return value:
* Nothing
*/

 #define DEBUG_MODE_FULL

#include "script_component.hpp"

PARAMS_4(_totalTime,_args,_onFinish,_onFail);
DEFAULT_PARAM(4,_localizedTitle,"");
DEFAULT_PARAM(5,_condition,{true});
_player = ACE_player;

closeDialog 0;
createDialog QGVAR(ProgressBar_Dialog);

(uiNamespace getVariable QGVAR(ctrlProgressBarTitle)) ctrlSetText _localizedTitle;

_perFrameFunction = {
	PARAMS_2(_parameters,_pfhID);
	EXPLODE_7_PVT(_parameters,_args,_onFinish,_onFail,_condition,_player,_startTime,_totalTime);
	
	_elapsedTime = time - _startTime;
	
	_errorCode = -1;
	if (isNull (uiNamespace getVariable [QGVAR(ctrlProgressBar), controlNull])) then {
		_errorCode = 1;
	} else {
		if (ACE_player != _player) then {
			_errorCode = 2;
		} else {
			if (!([_args, _elapsedTime, _totalTime] call _condition)) then {
				_errorCode = 3;
			} else {
				if (_elapsedTime >= _totalTime) then {
					_errorCode = 0;
				};
			};
		};
	};
	
	if (_errorCode != -1) then {
		closeDialog 0;
		[_pfhID] call CBA_fnc_removePerFrameHandler;
		if (_errorCode == 0) then {
			if (typeName _onFinish == typeName "") then {
				[_onFinish, [_args, _elapsedTime, _totalTime, _errorCode]] call EFUNC(common,localEvent);
			} else {
				[_args, _elapsedTime, _totalTime, _errorCode] call _onFinish;
			};
		} else {
			if (typeName _onFail == typeName "") then {
				[_onFail, [_args, _elapsedTime, _totalTime, _errorCode]] call EFUNC(common,localEvent);
			} else {
				[_args, _elapsedTime, _totalTime, _errorCode] call _onFail;
			};
		};
	} else {
		//Update Progress Bar
		_progress = _elapsedTime / _totalTime;
		systemChat str _progress;
		systemChat str (uiNamespace getVariable QGVAR(ctrlProgressBar));
		(uiNamespace getVariable QGVAR(ctrlProgressBar)) progressSetPosition _progress;
	};
};

[_perFrameFunction, 0, [_args, _onFinish, _onFail, _condition, _player, time, _totalTime]] call CBA_fnc_addPerFrameHandler;
