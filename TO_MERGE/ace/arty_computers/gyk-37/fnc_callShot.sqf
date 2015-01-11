//fnc_callShot.sqf
#include "script_component.hpp"

_mode = _this select 0;
_idc = _this select 1;

_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];
_currentSolution = _solutions select _solutionsIndex;

_time = ((_currentSolution select 0) select 2);

_countDownFunc = {
	GVAR(countDown) = true;
	_params 		= _this select 0;
	_time 			= _params select 0;
	_startTime 		= _params select 1;
	_idc 			= _params select 2;
	_countDown = _time - (diag_tickTime-_startTime);
	_timePrec = (floor((_countDown - (floor _countDown))*10))/10;
	_countDown = (floor _countDown)+_timePrec;
	_countDown = (_countDown max 0);
	_countDownText = "";
	if((_countDown mod 1) == 0) then {
		_countDownText = (str _countDown) + ".0";
	} else {
		_countDownText = (str _countDown);
	};
	ctrlSetText [_idc, _countDownText];
	if(_countDown <= 0) then {
		ctrlSetText [_idc, "IMPACT"];
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
		GVAR(countDown) = false;
	};
};
if(!GVAR(countDown)) then {
	if(_time > 0) then {
		[_countDownFunc, 0.1, [_time, diag_tickTime, _idc]] call CBA_fnc_addPerFrameHandler;
	};
};