/**
 * fn_cardiacArrest_CMS.sqf
 * @Descr: Triggers a unit into the Cardiac Arrest state from CMS. Will put the unit in an unconscious state and run a countdown timer until unit dies. <br />Timer is a random value between 120 and 720 seconds.
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT (The unit that will be put in cardiac arrest state)]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_unit", "_modifier","_timer","_counter", "_heartRate"];
_unit = _this select 0;

if (_unit getvariable [QGVAR(inCardiacArrest),false]) exitwith {};
[format["%1 is put into cardiac arrest",_unit]] call EFUNC(common,debug);
_unit setvariable [QGVAR(inCardiacArrest), true,true];
[_unit,QGVAR(heartRate), 0] call EFUNC(common,setDefinedVariable);


[_unit] call EFUNC(common,setUnconsciousState);
_counter = 120 + round(random(600));
_timer = 0;
while {(_timer < _counter && alive _unit)} do {
	_heartRate = [_unit,QGVAR(heartRate)] call EFUNC(common,getDefinedVariable);
	if (_heartRate > 0) exitwith {
		[format["%1 is moved out of cardiac: %2",_unit, _heartRate]] call EFUNC(common,debug);
		_unit setvariable [QGVAR(inCardiacArrest), nil,true];
	};
	if (_counter - _timer < 1) exitwith {
		[_unit] call FUNC(setDead_CMS);
	};
	sleep 1;
	_timer = _timer + 1;
};

_unit setvariable [QGVAR(inCardiacArrest), nil,true];