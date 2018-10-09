#include "script_component.hpp"
/*
 * Author: 654wak654
 * Cleans up pylons on client disconnect.
 *
 * Arguments:
 * 0: Player <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_pylons_fnc_handleDisconnect
 *
 * Public: No
 */

params ["", "", "_uid"];

private _aircraft = GVAR(currentAircraftNamespace) getVariable ["_uid", objNull];
if (!isNull _aircraft) then {
    _aircraft setVariable [QGVAR(currentUser), objNull, true];

    GVAR(currentAircraftNamespace) setVariable [_uid, nil, true]; // Remove var from namespace, no need to keep objNull
};
