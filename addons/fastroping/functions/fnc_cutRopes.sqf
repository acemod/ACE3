#include "script_component.hpp"
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
params ["_vehicle"];

private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
{
    _x params ["", "_ropeTop", "_ropeBottom", "_dummy", "_hook", "_occupied"];

    //Make player fall if rope is occupied
    if (_occupied) then {
        private _attachedObjects = attachedObjects _dummy;
        //Rope is considered occupied when it's broken as well, so check if array is empty
        //Note: ropes are not considered attached objects by Arma
        if !(_attachedObjects isEqualTo []) then {
            detach ((attachedObjects _dummy) select 0);
        };
    };

    //Destroy rope
    //Only delete the hook first so the rope falls down.
    //Note: ropeDetach was used here before, but the command seems a bit broken.
    deleteVehicle _hook;
    [{{deleteVehicle _x} count _this}, [_ropeTop, _ropeBottom, _dummy], 60] call CBA_fnc_waitAndExecute;
} count _deployedRopes;

_vehicle setVariable [QGVAR(deployedRopes), [], true];

// Set new state (0 if no FRIES, 2 if FRIES for manual stowing)
private _newState = [0, 2] select (isText (configFile >> "CfgVehicles" >> typeOf _vehicle >> QGVAR(onCut)));
_vehicle setVariable [QGVAR(deploymentStage), _newState, true];
