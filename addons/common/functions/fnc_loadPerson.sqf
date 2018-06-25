#include "script_component.hpp"
/*
 * Author: Glowbal
 * Loads a specified unit into any nearby vehicle, or _vehicle parameter.
 *
 * Arguments:
 * 0: Unit that will load <OBJECT>
 * 1: Unit to be loaded <OBJECT>
 * 2: Vehicle that the unit will be loaded in <OBJECT> (default: objNull)
 *
 * Return Value:
 * Vehicle that the unitToBeloaded has been loaded in. Returns objNull if function failed <OBJECT>
 *
 * Example:
 * [bob, kevin] call ace_common_fnc_loadPerson
 *
 * Public: Yes
 */

#define GROUP_SWITCH_ID QFUNC(loadPerson)

params ["_caller", "_unit", ["_vehicle", objNull]];

if (!([_caller, _unit, ["isNotDragging", "isNotCarrying", "isNotSwimming"]] call FUNC(canInteractWith)) || {_caller == _unit}) exitWith {_vehicle};

// Try to use nearest vehicle if a vehicle hasn't been supplied
if (isNull _vehicle) then {
    _vehicle = ([_unit] call FUNC(nearestVehiclesFreeSeat)) param [0, objNull];
};

if (!isNull _vehicle) then {
    [_unit, true, GROUP_SWITCH_ID, side group _caller] call FUNC(switchToGroupSide);
    ["ace_loadPersonEvent", [_unit, _vehicle, _caller], _unit] call CBA_fnc_targetEvent;
};

_vehicle
