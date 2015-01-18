/*
	Name: fnc_applyDust.sqf

	Author: Garth de Wet (LH)

	Description:
	Applies dust to screen.

	Parameters:
	Nothing

	Returns:
	Nothing

	Example 1:
	call FUNC(ApplyDust);
*/
#include "script_component.hpp"
if (call FUNC(ExternalCamera)) exitWith {};
if (ace_player call FUNC(isGogglesVisible)) exitWith {
	100 cutRsc["RscACE_GogglesEffects", "PLAIN",2,false];
	(uiNamespace getVariable ["ACE_Goggles_DisplayEffects", displayNull] displayCtrl 10662) ctrlSetText format[getText(ConfigFile >> "CfgGlasses" >> GVAR(Current) >> "ACE_DustPath"), GETDUSTT(DAMOUNT)+1];
	SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)+1,0,1));
	SETDUST(DBULLETS,0);
};

if (GETVAR(ace_player,ACE_EyesDamaged,false)) exitWith {SETDUST(DACTIVE,false);SETDUST(DBULLETS,0);SETDUST(DAMOUNT,0);};
SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)+1,0,2));

private "_amount";
_amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);

GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
GVAR(PostProcessEyes) ppEffectCommit 1;
GVAR(PostProcessEyes) ppEffectEnable true;
if !(scriptDone GVAR(DustHandler)) then {
	terminate GVAR(DustHandler);
};
SETDUST(DBULLETS,0);
GVAR(DustHandler) = [3] spawn {
	private ["_loop", "_timeToSleep"];
	_timeToSleep = _this select 0;
	_loop = true;
	while {_loop} do {
		sleep _timeToSleep;
		_timeToSleep = GETDUSTT(DTIME);

		if(_timeToSleep >= (time - 2.5)) then {
			_timeToSleep = time - _timeToSleep;
		} else {
			SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)-1,0,2));
			private "_amount";
			_amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);
			if !(ace_player getVariable ["ACE_EyesDamaged", false]) then {
				GVAR(PostProcessEyes) ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
				GVAR(PostProcessEyes) ppEffectCommit 1;
				sleep 1;
			};
			if (GETDUSTT(DAMOUNT) <= 0) then {
				GVAR(PostProcessEyes) ppEffectEnable false;
				SETDUST(DACTIVE,false);
				SETDUST(DBULLETS,0);
				_loop = false;
			};
			SETDUST(DTIME,time);
			_timeToSleep = 3;
		};
	};
};
