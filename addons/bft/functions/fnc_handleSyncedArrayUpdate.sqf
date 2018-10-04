#include "script_component.hpp"

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


params ["_varName", "_data"];

systemChat format["handleSyncedArrayUpdate - %1", _this];
diag_log format["handleSyncedArrayUpdate - %1", _this];

private _elementID = if (typeName _data == "ARRAY") then {_data select 0} else {_data};
private _variable = missionNamespace getvariable [_varName, []];
{
    private _compareID = if (typeName _x == "ARRAY") then {_x select 0} else {_x};
    if (_compareID isEqualTo _elementID) exitwith {
        _variable set [_forEachIndex, _data];
        ["bft_syncedArrayChanged", [1, _data, _x]] call CBA_fnc_localEvent;
    };
} forEach _variable;

systemChat format["handleSyncedArrayUpdate var- %1", _variable];
diag_log format["handleSyncedArrayUpdate var- %1", _variable];
