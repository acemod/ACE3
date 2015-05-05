
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

private ["_varName", "_data", "_variable"];
_varName = _this select 0;
_data = _this select 1;

systemChat format["handleSyncedArrayPushback: %1", _this];
diag_log format["handleSyncedArrayPushback: %1", _this];

_variable = missionNamespace getvariable [_varName, []];
_variable pushback _data;

systemChat format["%1 - %2", _varName, _variable];
diag_log format["%1 - %2", _varName, _variable];


if (isServer) then {
	if !(_varName in GVAR(syncedArrayVariables)) then {
		GVAR(syncedArrayVariables) pushback _varName;
	};
};
