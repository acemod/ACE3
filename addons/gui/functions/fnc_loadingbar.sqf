/**
 * fn_gui_loadingbar.sqf
 * @Descr: Displays a loading bar and halts script until loading bar has finished
 * @Author: Glowbal
 *
 * @Arguments: [timeToWait NUMBER, condition CODE (Optional), onSuccess CODE (Optional), onFailure CODE (Optional), arguments ARRAY (Optional)]
 * @Return: BOOl Returns true if loading bar has fully finished. Otherwise false
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_timeToWait","_cond","_onfailure","_onSuccess","_args","_dialog","_ctrl","_newStatus","_start","_return"];
_timeToWait = _this select 0;
_cond = [_this, 1, {true}, [{true}]] call BIS_fnc_Param;
_onSuccess = [_this, 2, {}, [{}]] call BIS_fnc_Param;
_onfailure = [_this, 3, {}, [{}]] call BIS_fnc_Param;
_args = [_this, 4, [], [[]]] call BIS_fnc_Param;

if (_timeToWait > 0) then {
	disableSerialization;
	1534 cutRsc [QGVAR(RSC_PROGRESSBAR_LOADING),"plain"];
	_dialog = uiNamespace getvariable QGVAR(RSC_PROGRESSBAR_LOADING);
	_ctrl = _dialog displayCtrl 6;
	_newStatus = 0;
	_start = diag_tickTime;
	while {(_newStatus <= 1.00 && (call _cond))} do {
		uisleep 0.01;
		_ctrl progressSetPosition _newStatus;
		_newStatus = (diag_tickTime - _start) / _timeToWait;
	};
	1534 cutText ["","plain"];
	_return = false;
	if (_newStatus >= 1.00) then {
		_return = true;
		_args call _onSuccess;
	} else {
		_args call _onfailure;
	};
} else {
	if ((call _cond)) then {
		_return = true;
		_args call _onSuccess;
	} else {
		_args call _onfailure;
	};
};
_return