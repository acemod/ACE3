#include "script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Stows the helicopters FRIES.
 *
 * Arguments:
 * 0: A helicopter with prepared FRIES <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_vehicle] call ace_fastroping_fnc_stowFRIES
 *
 * Public: No
 */
params ["_vehicle"];

//Stage indicator: 0 - travel mode; 1 - preparing/stowing FRIES; 2 - FRIES ready; 3 - ropes deployed
_vehicle setVariable [QGVAR(deploymentStage), 1, true];

private _config = configFile >> "CfgVehicles" >> typeOf _vehicle;
private _waitTime = 0;
if (isText (_config >> QGVAR(onCut))) then {
    _waitTime = [_vehicle] call (missionNamespace getVariable (getText (_config >> QGVAR(onCut))));
};

[{
    _this setVariable [QGVAR(deploymentStage), 0, true];
}, _vehicle, _waitTime] call CBA_fnc_waitAndExecute;
