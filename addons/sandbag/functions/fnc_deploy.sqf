#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support
 * Starts the deployment process for sandbags.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sandbag_fnc_deploy
 *
 * Public: No
 */

params ["_unit"];

// Prevent the placing unit from running
[_unit, "forceWalk", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), true] call EFUNC(common,statusEffect_set);

// Create the sandbag
private _sandBag = createVehicle ["ACE_SandbagObject_NoGeo", [0, 0, 0], [], 0, "NONE"];

// Prevent collisions with sandbag
[QEGVAR(common,enableSimulationGlobal), [_sandBag, false]] call CBA_fnc_serverEvent;

GVAR(deployDistance) = 1;
GVAR(deployDirection) = 0;
GVAR(deployHeight) = 0;

// PFH that runs while the deployment is in progress
GVAR(deployPFH) = [{
    (_this select 0) params ["_unit", "_sandBag"];

    if (isNull _sandBag) exitWith {
        _unit call FUNC(deployCancel);
    };

    _sandBag setPosASL (eyePos _unit vectorAdd (positionCameraToWorld [0, GVAR(deployHeight), GVAR(deployDistance)] vectorDiff positionCameraToWorld [0, 0, 0]));
    _sandBag setDir (GVAR(deployDirection) + getDir _unit);
}, 0, [_unit, _sandBag]] call CBA_fnc_addPerFrameHandler;

// Add mouse button action and hint
[LLSTRING(confirmDeployment), LLSTRING(cancelDeployment), LLSTRING(scrollAction)] call EFUNC(interaction,showMouseHint);

// Intercept left mouse button to confirm sandbag deployment
_unit setVariable [QGVAR(deploy), [
    _unit,
    "DefaultAction",
    {GVAR(deployPFH) != -1},
    {(_this select 1) call FUNC(deployConfirm)}
] call EFUNC(common,addActionEventHandler)];

_unit setVariable [QGVAR(sandbag), _sandBag, true];
