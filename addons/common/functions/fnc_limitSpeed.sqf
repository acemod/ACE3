/**
 * fn_limitSpeed.sqf
 * @Descr: Limits the speed of an object
 * @Author: Glowbal
 *
 * @Arguments: [vehicle OBJECT, maxSpeed NUMBER]
 * @Return: void
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_vehicle", "_maxSpeed"];
_vehicle = _this select 0;
_maxSpeed = _this select 1;

if ((_vehicle getvariable [QGVAR(limitSpeed_f),false])) then {
	_vehicle setvariable [QGVAR(limitSpeed_f),nil,true];
};

if (_maxSpeed < 0) exitwith {};
_vehicle setvariable [QGVAR(limitSpeed_f),true,true];

{
	private["_vehicle","_maxSpeed","_speed","_x","_y","_z", "_diff","_percentage","_newVelocity","_velocity"];
	_vehicle = (_this select 0) select 0;
	_maxSpeed = (_this select 0) select 1;
	if !(_vehicle getvariable [QGVAR(limitSpeed_f),false]) exitwith {
		[(_this select 1)] call cba_fnc_removePerFrameHandler;
	};

	_speed = speed _vehicle;
	if (_speed > _maxSpeed) then {
		_velocity = velocity _vehicle;
		_x = _velocity select 0;
		_y = _velocity select 1;
		_z = _velocity select 2;

		_diff = _speed - _maxSpeed;
		_percentage = (_speed / 100) * _diff;
		_newVelocity = [_x - (_x * _percentage), _y - (_y * _percentage), _z - (_z * _percentage)];
		_vehicle setVelocity _newVelocity;
	};
}, 0, [_vehicle,_maxSpeed] ] call CBA_fnc_addPerFrameHandler;
