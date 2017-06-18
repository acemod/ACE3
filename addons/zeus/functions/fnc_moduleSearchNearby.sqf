/*
 * Author: SilentSpike
 * Commands the group the module is placed on to search the nearest building
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
 * [LOGIC, [bob, kevin], true] call ace_zeus_fnc_moduleSearchNearby
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic","_units","_activated"];

if !(_activated && local _logic) exitWith {};

//Validate the module target:
private _unit = effectiveCommander (attachedTo _logic);
private _building = nearestBuilding (getPosASL _unit);

scopeName "Main";
private _fnc_errorAndClose = {
    params ["_msg"];
    deleteVehicle _logic;
    [_msg] call FUNC(showMessage);
    breakOut "Main";
};

switch (false) do {
    case !(isNull _unit): {
        [LSTRING(NothingSelected)] call _fnc_errorAndClose;
    };
    case (_unit isKindOf "CAManBase"): {
        [LSTRING(OnlyInfantry)] call _fnc_errorAndClose;
    };
    case (alive _unit): {
        [LSTRING(OnlyAlive)] call _fnc_errorAndClose;
    };
    case (_unit distance _building < 500): {
        [LSTRING(BuildingTooFar)] call _fnc_errorAndClose;
    };
};

//Perform the module function:
[QGVAR(moduleSearchNearby), [_unit], _unit] call CBA_fnc_targetEvent;
deleteVehicle _logic;
