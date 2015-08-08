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

#include "script_component.hpp"

PARAMS_2(_varName,_data);

private ["_variable"];

systemChat format["handleSyncedArrayPushback: %1", _this];
diag_log format["handleSyncedArrayPushback: %1", _this];

_variable = missionNamespace getvariable [_varName, []];
_variable pushback _data;
missionNamespace setvariable [_varName, _variable];

["bft_syncedArrayChanged", [0, _data]] call EFUNC(common,localEvent);

systemChat format["handleSyncedArrayPushback %1 - %2", _varName, _variable];
diag_log format["handleSyncedArrayPushback %1 - %2", _varName, _variable];

if (isServer) then {
    if !(_varName in GVAR(syncedArrayVariables)) then {
        GVAR(syncedArrayVariables) pushback _varName;
    };
};
