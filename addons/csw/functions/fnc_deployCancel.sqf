#include "..\script_component.hpp"
/*
 * Author: Garth 'L-H' de Wet, Ruthberg, commy2, Smith, johnb43
 * Cancels unloading when deploying.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * player call ace_csw_fnc_deployCancel
 *
 * Public: No
 */

if (GVAR(deployPFH) == -1) exitWith {};

// Remove deployment pfh
GVAR(deployPFH) call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

params ["_player"];

// Enable running again
[_player, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_player, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

// Delete placement dummy
deleteVehicle GVAR(tripodPreviewObject);

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);

[_player, "DefaultAction", _player getVariable [QGVAR(deploy), -1]] call EFUNC(common,removeActionEventHandler);
_player setVariable [QGVAR(deploy), -1];

_player setVariable [QGVAR(isDeploying), false, true];
