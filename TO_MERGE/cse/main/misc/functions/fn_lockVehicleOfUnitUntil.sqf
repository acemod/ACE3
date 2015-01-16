/**
 * fn_lockVehicleOfUnitUntil.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

private ["_unit","_vehicleOfUnit","_lockSwitch"];
_unit = [_this, 0,ObjNull,[ObjNull]] call BIS_fnc_Param;
_vehicleOfUnit = vehicle _unit;
_lockSwitch = false;
waituntil{
	if (!_lockSwitch) then {
		if (_vehicleOfUnit != _unit) then {
			if (locked _vehicleOfUnit != 0) then {
				_lockSwitch = true;
				_vehicleOfUnit lock true;
				[format["VEHICLE LOCKED %1", _vehicleOfUnit]] call cse_fnc_debug;
			};
		};
	} else {
		if (vehicle _unit == _unit) then {
			_vehicleOfUnit lock false;
			_lockSwitch = false;
			[format["VEHICLE UNLOCKED %1", _vehicleOfUnit]] call cse_fnc_debug;
		};
	};
 (!(_unit getvariable ["cse_state_unconscious", false]) || !alive _unit)};

if (_lockSwitch) then {
	_vehicleOfUnit lock false;
	[format["VEHICLE UNLOCKED %1", _vehicleOfUnit]] call cse_fnc_debug;
} else {
	[format["NO VEHICLE TO UNLOCKED %1", _unit]] call cse_fnc_debug;
};