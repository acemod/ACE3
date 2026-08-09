#include "..\script_component.hpp"
/*
 * Author: johnb43
 * Clean up nozzle and helper objects when a fuel source is destroyed.
 *
 * Arguments:
 * 0: Object <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * cursorObject call ace_refuel_fnc_handleDestroyed
 *
 * Public: No
 */

params ["_object"];
TRACE_1("deleted",_object);

private _nozzle = _object getVariable [QGVAR(ownedNozzle), objNull];

if (isNull _nozzle) exitWith {};

private _sink = _nozzle getVariable [QGVAR(sink), objNull];

if (!isNull _sink) then {
    _sink setVariable [QGVAR(nozzle), nil, true];
};

private _unit = attachedTo _nozzle;

if !(_unit isKindOf "CAManBase") then {
    _unit = objNull;
};

[_unit, _nozzle] call FUNC(dropNozzle);

deleteVehicle (_nozzle getVariable [QGVAR(helper), objNull]);
deleteVehicle _nozzle;
