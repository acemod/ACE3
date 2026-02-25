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

params ["_unit"];

if (isNull _unit) exitWith {};

// Enable running again
[_unit, "forceWalk", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);
[_unit, "blockThrow", QUOTE(ADDON), false] call EFUNC(common,statusEffect_set);

private _sandbag = _unit getVariable [QGVAR(sandBag), objNull];

// Delete placement dummy, if present (don't early exit, in case dummy was deleted by something else, as still need to clean up)
if (!isNull _sandbag) then {
    deleteVehicle _sandbag;

    _unit setVariable [QGVAR(sandbag), nil, true];
};

// Stop intercepting left mouse button
private _ehID = _unit getVariable [QGVAR(deploy), -1];

if (_ehID != -1) then {
    [_unit, "DefaultAction", _ehID] call EFUNC(common,removeActionEventHandler);

    _unit setVariable [QGVAR(deploy), nil];
};

// Only remove deployment PFH if unit is current player
if (_unit != ACE_player || {GVAR(deployPFH) == -1}) exitWith {};

// Remove deployment PFH
GVAR(deployPFH) call CBA_fnc_removePerFrameHandler;
GVAR(deployPFH) = -1;

// Remove mouse button actions
call EFUNC(interaction,hideMouseHint);
