/**
 * fn_cardiacArrest_CMS.sqf
 * @Descr: Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies. <br />Timer is a random value between 120 and 720 seconds.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that will be put in cardiac arrest state)]
 * @Return: void
 * @PublicAPI: true
 */


private ["_unit", "_modifier","_timer","_counter", "_heartRate"];
_unit = _this select 0;

if (_unit getvariable ["cse_cardiacArrest_CMS",false]) exitwith {};
[format["%1 is put into cardiac arrest",_unit]] call cse_fnc_debug;
_unit setvariable ["cse_cardiacArrest_CMS", true,true];
[_unit,"cse_heartRate", 0] call cse_fnc_setVariable;


[_unit] call cse_fnc_setUnconsciousState;
_counter = 120 + round(random(600));
_timer = 0;
while {(_timer < _counter && alive _unit)} do {
	_heartRate = [_unit,"cse_heartRate"] call cse_fnc_getVariable;
	if (_heartRate > 0) exitwith {
		[format["%1 is moved out of cardiac: %2",_unit, _heartRate]] call cse_fnc_debug;
		_unit setvariable ["cse_cardiacArrest_CMS", nil,true];
	};
	if (_counter - _timer < 1) exitwith {
		[_unit] call cse_fnc_setDead_CMS;
	};
	sleep 1;
	_timer = _timer + 1;
};

_unit setvariable ["cse_cardiacArrest_CMS", nil,true];