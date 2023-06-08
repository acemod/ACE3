#include "script_component.hpp"
/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * origin <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */


params ["_origin"];

diag_log format["handleRequestAllData: Request from Origin: %1", _origin];

{
    diag_log format["handleRequestAllData: Add Device Data to origin: %1", _x];
    ["bft_addDeviceData", _origin, _x] call CBA_fnc_targetEvent;
} forEach GVAR(deviceData);

// Alternative:
//if (count GVAR(deviceData) > 0) then {
//    (owner _origin) publicVariableClient QGVAR(deviceData);
//};

{
    diag_log format["handleRequestAllData: Add synced array variable: %1", _x];
    private _varName = _x;
    private _variable = missionNamespace getvariable [_varName, []];

    {
        diag_log format["handleRequestAllData: Add synced array variable (%1) value: %2", _varName, _x];
        ["bft_syncedArrayPushback", _origin, [_varName, _x]] call CBA_fnc_targetEvent;
    } forEach _variable;

    // Alternative:
    //if (count _variable > 0) then {
    //    (owner _origin) publicVariableClient _x;
    //};
} forEach GVAR(syncedArrayVariables);
