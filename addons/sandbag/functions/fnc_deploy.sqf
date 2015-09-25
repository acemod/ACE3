/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support
 * Starts the deploy process for sandbags.
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ACE_player] call ace_sandbag_fnc_deploy
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

// prevent the placing unit from running
[_unit, "ACE_Sandbag", true] call EFUNC(common,setForceWalkStatus);

// create the sandbag
private "_sandBag";
_sandBag = createVehicle ["ACE_SandbagObject_NoGeo", [0, 0, 0], [], 0, "NONE"];

GVAR(sandBag) = _sandBag;

// prevent collisions with sandbag
["enableSimulationGlobal", [_sandBag, false]] call EFUNC(common,serverEvent);

GVAR(deployDirection) = 0;

// pfh that runs while the deployment is in progress
GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_sandBag"];

    if (isNull _sandBag) exitWith {
        [_unit] call FUNC(deployCancel);
    };

    _sandBag setPosASL (eyePos _unit vectorAdd (positionCameraToWorld [0, 0, 1] vectorDiff positionCameraToWorld [0, 0, 0]));
    _sandBag setDir (GVAR(deployDirection) + getDir _unit);
}, 0, [_unit, _sandBag]] call CBA_fnc_addPerFrameHandler;

// add mouse button action and hint
[localize LSTRING(ConfirmDeployment), localize LSTRING(CancelDeployment), localize LSTRING(ScrollAction)] call EFUNC(interaction,showMouseHint);

_unit setVariable [QGVAR(Deploy), [
    _unit, "DefaultAction",
    {GVAR(deployPFH) != -1 && !isNull (GVAR(sandBag))},
    {[_this select 0] call FUNC(deployConfirm)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(Cancel), [
    _unit, "zoomtemp",
    {GVAR(deployPFH) != -1 && !isNull (GVAR(sandBag))},
    {[_this select 0] call FUNC(deployCancel)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(isDeploying), true, true];
