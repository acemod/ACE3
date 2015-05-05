
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

private ["_varName", "_dataID", "_variable"];
_varName = _this select 0;
_elementID = _this select 1;

_variable = missionNamespace getvariable [_varName, []];
{
    if ((_x select 0) isEqualTo _elementID) exitwith {
        systemChat format["handleSyncedArrayDelete deleting- %1", _x];
        diag_log format["handleSyncedArrayDelete deleting- %1", _x];
        _variable deleteAt _foreachIndex;
    };
}foreach _variable;

systemChat format["handleSyncedArrayDelete var- %1", _variable];
diag_log format["handleSyncedArrayDelete var- %1", _variable];
