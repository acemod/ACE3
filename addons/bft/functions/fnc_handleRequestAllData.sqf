/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_origin", "_varName", "_variable"];
_origin = _this select 0;
{
	["bft_addDeviceData", _x, _origin] call EFUNC(common,targetEvent);
}foreach GVAR(deviceData);

// Alternative:
//if (count GVAR(deviceData) > 0) then {
//	(owner _origin) publicVariableClient QGVAR(deviceData);
//};

{
	_varName = _x;
	_variable = missionNamespace getvariable [_varName, []];
	{
		["bft_syncedArrayPushback", [_varName, _x], _origin] call EFUNC(common,targetEvent);
	}foreach _variable;

	// Alternative:
	//if (count _variable > 0) then {
	//	(owner _origin) publicVariableClient _x;
	//};
}foreach GVAR(syncedArrayVariables);

