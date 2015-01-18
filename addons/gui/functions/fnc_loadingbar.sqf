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

private ["_timeToWait","_cond","_onfailure","_onSuccess","_args"];
_timeToWait = _this select 0;
_cond = [_this, 1, {true}, [{true}]] call BIS_fnc_Param;
_onSuccess = [_this, 2, {}, [{}]] call BIS_fnc_Param;
_onfailure = [_this, 3, {}, [{}]] call BIS_fnc_Param;
_args = [_this, 4, [], [[]]] call BIS_fnc_Param;


if (_timeToWait > 0) exitwith {
	GVAR(LOADING_BAR_STATUS) = 0;
	disableSerialization;
	1534 cutRsc [QGVAR(RSC_PROGRESSBAR_LOADING),"plain"];
	[{
		private ["_args","_timeToWait","_start","_cond","_onSuccess","_onfailure","_params"];
		_args = _this select 0;

		_start = _args select 0;
		_timeToWait = _args select 1;
		_cond = _args select 2;
		_onSuccess = _args select 3;
		_onfailure = _args select 4;
		_params = _args  select 5;

		if !(_params call _cond) exitwith {
			[(_this select 1)] call cba_fnc_removePerFrameHandler;
			1534 cutText ["","plain"];
			_params call _onfailure;
		};

		if (GVAR(LOADING_BAR_STATUS) >= 1) exitwith {
			[(_this select 1)] call cba_fnc_removePerFrameHandler;
			1534 cutText ["","plain"];
			_params call _onSuccess;
		};
		private "_dialog";
		disableSerialization;
		_dialog = uiNamespace getvariable QGVAR(RSC_PROGRESSBAR_LOADING);

		GVAR(LOADING_BAR_STATUS) = (diag_tickTime - _start) / _timeToWait;
		(_dialog displayCtrl 6) progressSetPosition GVAR(LOADING_BAR_STATUS);

	}, 0, [diag_tickTime, _timeToWait, _cond, _onSuccess, _onfailure, _args]] call CBA_fnc_addPerFrameHandler;
	true;
};

if (_args call _cond) exitwith {
	_args call _onSuccess;
	true;
};

_args call _onfailure;
false;