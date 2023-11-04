#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, commy2, Smith
 * Cancels unloading when deploying.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_cargo_fnc_deployCancel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

// Remove deployment pfh
GVAR(deployPFH) call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

params ["_unit"];

// Enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Delete placement dummy
deleteVehicle GVAR(itemPreviewObject);

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_unit, "DefaultAction", _unit getVariable [QGVAR(deploy), -1]] call EFUNC(common,removeActionEventHandler);
_unit setVariable [QGVAR(deploy), -1];

_unit setVariable [QGVAR(isDeploying), false, true];
