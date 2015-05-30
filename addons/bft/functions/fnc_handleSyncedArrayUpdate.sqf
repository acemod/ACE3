
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

PARAMS_2(_varName,_data);

private ["_elementID", "_variable", "_compareID"];

systemChat format["handleSyncedArrayUpdate - %1", _this];
diag_log format["handleSyncedArrayUpdate - %1", _this];

_elementID = if (typeName _data == "ARRAY") then {_data select 0} else {_data};
_variable = missionNamespace getvariable [_varName, []];
{
    _compareID = if (typeName _x == "ARRAY") then {_x select 0} else {_x};
    if (_compareID isEqualTo _elementID) exitwith {
        _variable set[_forEachIndex, _data];
    };
} forEach _variable;

systemChat format["handleSyncedArrayUpdate var- %1", _variable];
diag_log format["handleSyncedArrayUpdate var- %1", _variable];
