#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Loads the object module is placed on into selected vehicle.
 *
 * Arguments:
 * 0: Module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleUnloadFromCargo
 *
 * Public: No
 */

if (canSuspend) exitWith {
    [FUNC(moduleUnloadFromCargo), _this] call CBA_fnc_directCall;
};

params ["_logic"];

if !(local _logic) exitWith {};

private _vehicle = attachedTo _logic;

deleteVehicle _logic;

if !(missionNamespace getVariable [QEGVAR(cargo,enable), false]) exitWith {
    [LSTRING(RequiresAddon)] call FUNC(showMessage);
};
if (isNull _vehicle) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!alive _vehicle) exitWith {
    [LSTRING(OnlyAlive)] call FUNC(showMessage);
};
if ((_vehicle getVariable [QEGVAR(cargo,loaded), []]) isEqualTo []) exitWith {
    [LSTRING(paradrop_noCargoLoaded)] call FUNC(showMessage);
};

EGVAR(cargo,interactionVehicle) = _vehicle;
EGVAR(cargo,interactionParadrop) = false;
createDialog QEGVAR(cargo,menu);
