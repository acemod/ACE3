/*
 * Author: Garth 'L-H' de Wet
 * Dials the number passed and detonates the explosive.
 *
 * Arguments:
 * 0: Unit to do dialing <OBJECT>
 * 1: Code to dial <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_player,"2131"] call ACE_explosives_fnc_dialPhone;
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_arr", "_ran", "_i","_speedDial"];
EXPLODE_2_PVT(_this,_unit,_code);
if (_unit getVariable [QGVAR(Dialing),false]) exitWith {};
if !(alive _unit) exitWith {};
_unit setVariable [QGVAR(Dialing), true, true];

_ran = (ceil(random 8)) + 1;
_arr = [];
for [{_i=0}, {_i<_ran}, {_i=_i+1}] do {
	_arr = _arr + ['.','..','...',''];
};
if (_unit == ace_player) then {
	ctrlSetText [1400,"Calling"];
	[{
		EXPLODE_4_PVT(_this select 0,_unit,_i,_arr,_code);
		if ((_i mod 4) == 0) then {
			playSound3D [QUOTE(PATHTOF_R(Data\Audio\DialTone.wss)), objNull, false, (_unit ModelToWorld [0,0.2,2]), 15,1,2.5];
		};
		ctrlSetText [1400,format["Calling%1",_arr select (_i - 4)]];
		if (_i >= (count _arr + 2)) then {
			[_this select 1] call CALLSTACK(cba_fnc_removePerFrameHandler);
			private "_explosive";
			_explosive = [_unit, _code] call FUNC(getSpeedDialExplosive);
			if (!isNull (_explosive)) then {
				[_unit, -1, [_explosive, 1]] call FUNC(detonateExplosive);
			};
			_unit setVariable [QGVAR(Dialing), false, true];
			if (_unit == ace_player) then {
				ctrlSetText [1400,"Call Ended!"];
			};
		};
		if (_i == (count _arr)) then {
			private "_explosive";
			_explosive = [_unit, _code] call FUNC(getSpeedDialExplosive);
			if (!isNull (_explosive)) then {
				playSound3D [QUOTE(PATHTOF_R(Data\Audio\Cellphone_Ring.wss)),objNull, false, getPosATL _explosive,3.16228,1,75];
			};
		};
		(_this select 0) set [1, _i + 1];
	}, 0.25, [_unit,4,_arr,_code]] call CALLSTACK(CBA_fnc_addPerFrameHandler);
} else {
	private ["_explosive"];
	_explosive = [_unit, _code] call FUNC(getSpeedDialExplosive);
	if (!isNull (_explosive)) then {
		[{
			playSound3D [QUOTE(PATHTOF_R(Data\Audio\Cellphone_Ring.wss)),objNull, false, getPosATL (_this select 1),3.16228,1,75];
			(_this select 0) setVariable [QGVAR(Dialing), false, true];
		}, [_unit,_explosive], 0.25 * (count _arr - 4), 0] call EFUNC(common,waitAndExecute);
		[_explosive,0.25 * (count _arr - 1)] call FUNC(startTimer);
	};
};
