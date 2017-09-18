/*
 * Author: 654wak654
 * TODO: Write description
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleLoadIntoCargo
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated && {local _logic}) exitWith {};

private _unit = effectiveCommander (attachedTo _logic);

deleteVehicle _logic;

if (isNull _unit) exitWith {
    [LSTRING(NothingSelected)] call FUNC(showMessage);
};
if (!alive _unit) exitWith {
    [localize LSTRING(OnlyAlive)] call FUNC(showMessage);
};

[
    _unit,
    {
        // TODO
    },
    localize LSTRING(ModuleLoadIntoCargo_DisplayName),
    "a3\ui_f\data\IGUI\Cfg\Actions\loadVehicle_ca.paa"
] call FUNC(getModuleDestination);
