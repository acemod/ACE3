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
 * [_vehicle] call ace_fastroping_fnc_cutRopes
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_vehicle"];
private ["_deployedRopes", "_config", "_waitTime"];

_deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
{
    _x params ["", "_ropeTop", "_ropeBottom", "_dummy", "_anchor", "_hook"];

    deleteVehicle _ropeTop;
    [{{deleteVehicle _x} count _this}, [_dummy, _anchor, _ropeBottom, _hook], 60] call EFUNC(common,waitAndExecute);
} count _deployedRopes;

_vehicle setVariable [QGVAR(deployedRopes), [], true];
_vehicle setVariable [QGVAR(deploymentStage), 1, true];

_config = configFile >> "CfgVehicles" >> typeOf _vehicle;
_waitTime = 0;
if (isText (_config >> QGVAR(onCut))) then {
    _waitTime = [_vehicle] call (missionNamespace getVariable (getText (_config >> QGVAR(onCut))));
};

[{
    _this setVariable [QGVAR(deploymentStage), 0, true];
}, _vehicle, _waitTime] call EFUNC(common,waitAndExecute);
