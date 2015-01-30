/**
 * fnc_onCarryObjectDropped.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

private ["_unit","_params"];
_unit = _this select 0;

[format["fnc_onCarryObjectDropped: %1",_this]] call EFUNC(common,debug);

_params = _unit getvariable QGVAR(onStartMovingUnitParams);
if (!isnil "_params") then {
	_params call FUNC(handleDropUnit);
};