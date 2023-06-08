#include "script_component.hpp"

/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: varName <STRING>
 * 1: element ID <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_varName", "_elementID"];

private _variable = missionNamespace getvariable [_varName, []];

{
    if ((_x select 0) isEqualTo _elementID) exitwith {
        systemChat format["handleSyncedArrayDelete deleting- %1", _x];
        diag_log format["handleSyncedArrayDelete deleting- %1", _x];
        private _removedElement = _variable deleteAt _foreachIndex;
        ["bft_syncedArrayChanged", [2, _removedElement]] call CBA_fnc_localEvent;

    };
} forEach _variable;

systemChat format["handleSyncedArrayDelete var- %1", _variable];
diag_log format["handleSyncedArrayDelete var- %1", _variable];
