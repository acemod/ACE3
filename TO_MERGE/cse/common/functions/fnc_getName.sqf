/**
 * fn_getName.sqf
 * @Descr: Get the name of unit
 * @Author: Glowbal
 *
 * @Arguments: [unit OBJECT]
 * @Return: STRING Name of object
 * @PublicAPI: true
 */

#include "script_component.hpp"

private["_unit","_return"];
_unit = _this select 0;
_return = "Unknown";

if (alive _unit) then {
	if (_unit iskindof "CAManBase") then {
		if (_unit getvariable [QGVAR(isDead),false]) then {
			_return = _unit getvariable [QGVAR(name),"Unknown"];
		} else {
			_return = name _unit;
		};
	};
} else {
	_return = _unit getvariable [QGVAR(name),"Unknown"];
};
_return