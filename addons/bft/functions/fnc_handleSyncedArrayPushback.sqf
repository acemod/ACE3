#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: varName <STRING>
 * 1: data <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_varName", "_data"];

systemChat format["handleSyncedArrayPushback: %1", _this];
diag_log format["handleSyncedArrayPushback: %1", _this];

private _variable = missionNamespace getvariable [_varName, []];
_variable pushback _data;
missionNamespace setvariable [_varName, _variable];

["bft_syncedArrayChanged", [0, _data]] call CBA_fnc_localEvent;

systemChat format["handleSyncedArrayPushback %1 - %2", _varName, _variable];
diag_log format["handleSyncedArrayPushback %1 - %2", _varName, _variable];

if (isServer && {!(_varName in GVAR(syncedArrayVariables))}) then {
    GVAR(syncedArrayVariables) pushback _varName;
};
