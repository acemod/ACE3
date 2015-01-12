/**
 * fn_getName.sqf
 * @Descr: Get the name of unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: STRING Name of object
 * @PublicAPI: true
 */

private["_unit","_return"];
_unit = _this select 0;
_return = "Unknown";

if (alive _unit) then {
	if (_unit iskindof "CAManBase") then {
		if (_unit getvariable ["cse_isDead",false]) then {
			_return = _unit getvariable ["cse_name","Unknown"];
		} else {
			_return = name _unit;
		};
	};
} else {
	_return = _unit getvariable ["cse_name","Unknown"];
};
_return