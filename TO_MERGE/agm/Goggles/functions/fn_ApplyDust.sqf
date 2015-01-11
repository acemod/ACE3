/*
	Name: AGM_Goggles_fnc_ApplyDust
	
	Author: Garth de Wet (LH)
	
	Description:
	Applies dust to screen.
	
	Parameters:
	Nothing
	
	Returns:
	Nothing
	
	Example 1:
	call AGM_Goggles_fnc_ApplyDust;
*/
#include "\AGM_Goggles\script.sqf"
if (call AGM_Goggles_fnc_ExternalCamera) exitWith {};
if (player call AGM_Goggles_fnc_isGogglesVisible) exitWith {
	100 cutRsc["RscAGM_GogglesEffects", "PLAIN",2,false];
	(uiNamespace getVariable ["AGM_Goggles_DisplayEffects", displayNull] displayCtrl 10662) ctrlSetText format[getText(ConfigFile >> "CfgGlasses" >> AGM_Goggles_Current >> "AGM_DustPath"), GETDUSTT(DAMOUNT)+1];
	SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)+1,0,1));
	SETDUST(DBULLETS,0);
};

if (player getVariable ["AGM_EyesDamaged", false]) exitWith {SETDUST(DACTIVE,false);SETDUST(DBULLETS,0);SETDUST(DAMOUNT,0);};
SETDUST(DAMOUNT,CLAMP(GETDUSTT(DAMOUNT)+1,0,2));

private "_amount";
_amount = 1 - (GETDUSTT(DAMOUNT) * 0.125);

AGM_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
AGM_Goggles_PostProcessEyes ppEffectCommit 1;
AGM_Goggles_PostProcessEyes ppEffectEnable true;
if !(scriptDone AGM_Goggles_DustHandler) then {
	terminate AGM_Goggles_DustHandler;
};
SETDUST(DBULLETS,0);
AGM_Goggles_DustHandler = [3] spawn {
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
			if !(player getVariable ["AGM_EyesDamaged", false]) then {
				AGM_Goggles_PostProcessEyes ppEffectAdjust[1, 1, 0, [0,0,0,0], [_amount,_amount,_amount,_amount],[1,1,1,0]];
				AGM_Goggles_PostProcessEyes ppEffectCommit 1;
				sleep 1;
			};
			if (GETDUSTT(DAMOUNT) <= 0) then {
				AGM_Goggles_PostProcessEyes ppEffectEnable false;
				SETDUST(DACTIVE,false);
				SETDUST(DBULLETS,0);
				_loop = false;
			};
			SETDUST(DTIME,time);
			_timeToSleep = 3;
		};
	};
};