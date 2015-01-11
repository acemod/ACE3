//fuze_prox.sqf
#include "\x\ace\addons\sys_arty_ammunition\script_component.hpp"

private["_shell", "_time", "_endTime", "_roundData", "_action", "_baseEjectFnc", "_timeFunc"];

_shell = _this select 6;
_time = time;
_endTime = 100000;
_roundData = (_this select 0) getVariable "ace_sys_arty_roundData";
{
	if ((_x select 0) == _shell) exitWith {
		_endTime = (_x select 2) select 0;
	};
} forEach _roundData;
_baseEjectFnc = {};
_action = getText(configFile >> "CfgAmmo" >> typeOf _shell >> "ACE_ARTY_BASE_EJECT_HANDLER");
if (!isNil "_action" && {_action != ""}) then {
	_baseEjectFnc = COMPILE_FILE2_SYS(_action);
};

_shell = _this select 6;
[
	{
		if (alive _shell) then {
			_lastPos = getPos _shell;
			_lastVel = velocity _shell;
		};
		if (_endTime == 100000) then {
			_roundData = (_fireEHParams select 0) getVariable "ace_sys_arty_roundData";
			{
				if((_x select 0) == _shell) exitWith {
					_endTime = (_x select 2) select 0;
				};
			} forEach _roundData;
			if(_endTime != 100000) then {
				(_this select 0) set [2, _endTime];
			};
		};
		
		if (_timeStart + _endTime <= time) then {
			_timeExpired = true;
			_delete = false;
			_result = _fireEHParams call _baseEjectFnc;
			_baseEjectFnc = {};
			
			if (isNil "_result") then {
				_delete = false;
			} else {
				if (_result) then {
					_delete = true;
				};
			};
			
			if (_delete) then {
				deleteVehicle _shell;
			} else {
				_lastVel = velocity _shell;
				_pos = getPos _shell;
				_explosionClass = getText(configFile >> "CfgAmmo" >> typeOf _shell >> "ACE_ARTY_EXPLOSION");
				_exp = _explosionClass createVehicle _pos;
				_exp setVectorDir _lastVel;
				deleteVehicle _shell;
			};
		};
	},
	[_shell, _time, _endTime, _baseEjectFnc, _this],
	0.0, // delay
	{
		//init
		_shell 			= _this select 0;
		_timeStart 		= _this select 1;
		_endTime 		= _this select 2;
		_baseEjectFnc 	= _this select 3;
		_fireEHParams 	= _this select 4;
		_shellType = typeOf _shell;
		_lastPos = [];
		_lastVel = [];
		_timeExpired = false;
	},
	{
		if (!_timeExpired) then {
			_delete = false;
			_result = _fireEHParams call _baseEjectFnc;
			
			if (isNil "_result") then { //  || isNull _result // isNull throws script error, as we are processing a bool here.
				_delete = false;
			} else {
				if (_result) then {
					_delete = true;
				};
			};
			if (_delete) then {
				deleteVehicle _shell;
			} else {
				_explosionClass = getText(configFile >> "CfgAmmo" >> _shellType >> "ACE_ARTY_EXPLOSION");
				_exp = _explosionClass createVehicle _lastPos;
				_exp setVectorDir _lastVel;
			};
		};
	},
	{
		true
	},
	{!alive _shell},
	[ 
		"_shell", "_timeStart", "_endTime", "_baseEjectFnc", "_fireEHParams", "_lastPos", "_lastVel", "_timeExpired", "_shellType"
	]
] call cba_common_fnc_addPerFrameHandlerLogic;
