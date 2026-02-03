#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, edited by commy2 for better MP and eventual AI support
 * Cancels sandbag deployment.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_sandbag_fnc_deployCancel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

// Remove deployment PFH
GVAR(deployPFH) call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

params ["_unit"];

// Enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Delete placement dummy
deleteVehicle GVAR(sandBag);

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(deploy), -1]] call EFUNC(common,removeActionEventHandler);
_unit setVariable [QGVAR(deploy), nil];

_unit setVariable [QGVAR(isDeploying), nil, true];
