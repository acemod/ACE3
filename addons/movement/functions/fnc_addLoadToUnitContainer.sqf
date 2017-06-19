/*
 * Author: commy2
 * Add (negative numbers to subtract) a virtual mass to a units container.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: The Container <OBJECT>
 * 2: The Virtual Load <NUMBER>
 *
 * Return Value:
 * Success? <BOOLEAN>
 *
 * Example:
 * [bob, box, 5] call ace_movement_fnc_addLoadToUnitContainer
 *
 * Public: No
 */
#include "script_component.hpp"

params [["_unit", objNull, [objNull]], ["_container", objNull, [objNull]], ["_virtualLoadToAdd", 0, [0]]];

if !(_container in [
    _unit,
    uniformContainer _unit,
    vestContainer _unit,
    backpackContainer _unit
]) exitWith {false};

private _virtualLoad = (_container getVariable [QGVAR(vLoad), 0]) + _virtualLoadToAdd;
_container setVariable [QGVAR(vLoad), _virtualLoad, true];

// update
_unit call FUNC(handleVirtualMass);

true
