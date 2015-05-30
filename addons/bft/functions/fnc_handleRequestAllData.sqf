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

#include "script_component.hpp"

PARAMS_1(_origin);

{
    ["bft_addDeviceData", _x, _origin] call EFUNC(common,targetEvent);
} forEach GVAR(deviceData);

// Alternative:
//if (count GVAR(deviceData) > 0) then {
//    (owner _origin) publicVariableClient QGVAR(deviceData);
//};

{
    private ["_varName", "_variable"];
    _varName = _x;
    _variable = missionNamespace getvariable [_varName, []];
    
    {
        ["bft_syncedArrayPushback", [_varName, _x], _origin] call EFUNC(common,targetEvent);
    } forEach _variable;

    // Alternative:
    //if (count _variable > 0) then {
    //    (owner _origin) publicVariableClient _x;
    //};
} forEach GVAR(syncedArrayVariables);
