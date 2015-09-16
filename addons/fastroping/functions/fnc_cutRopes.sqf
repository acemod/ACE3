/*
 * Author: BaerMitUmlaut
 * Cut deployed ropes.
 *
 * Arguments:
 * 0: A helicopter with deployed ropes <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_cutRopes
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];
private ["_deployedRopes"];

_deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
{
    _x params ["", "_ropeTop", "_ropeBottom", "_dummy", "_anchor", "_hook"];

    deleteVehicle _ropeTop;
    [{{deleteVehicle _x} count _this}, [_dummy, _anchor, _ropeBottom, _hook], 60] call EFUNC(common,waitAndExecute);
} count _deployedRopes;

_vehicle setVariable [QGVAR(deployedRopes), [], true];
