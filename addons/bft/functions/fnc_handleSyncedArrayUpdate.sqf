
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: variableName <STRING>
 * 1: data. Must contain first element ID <ARRAY>
 * 2: Indexes of updated data. Either empty or have first element be 0. <ARRAY> <OPTIONAL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_varName", "_data", "_elementID", "_variable","_element", "_compareID"];
_varName = _this select 0;
_data = _this select 1;

systemChat format["handleSyncedArrayUpdate - %1", _this];
diag_log format["handleSyncedArrayUpdate - %1", _this];

_elementID = if (typeName _x == "ARRAY") then {_data select 0} else {_data};
_variable = missionNamespace getvariable [_varName, []];
{
	_compareID = if (typeName _x == "ARRAY") then {_x select 0} else {_x};
	if (_compareID isEqualTo _elementID) exitwith {
		_variable set[_foreachIndex, _data];
	};
}foreach _variable;

systemChat format["handleSyncedArrayUpdate var- %1", _variable];
diag_log format["handleSyncedArrayUpdate var- %1", _variable];
