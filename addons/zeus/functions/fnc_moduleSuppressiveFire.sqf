/*
 * Author: bux
 * Commands the selected unit or group to start suppressive fire on the unit, group or location the module is placed on
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated && local _logic) exitWith {};

// Validate the module target
private _unit = effectiveCommander (attachedTo _logic);
TRACE_2("moduleSuppressiveFire placed",_unit,_logic);

deleteVehicle _logic;

if (!alive _unit) exitWith {};

[FUNC(getModuleDestination), [_unit, {
    params ["_successful", "_object", "_mousePosASL"];
    TRACE_3("sup fire place return",_successful,_object,_mousePosASL);
    if (!_successful) exitWith {};

    // todo:
    _object doMove _mousePosASL; // demo

}]] call CBA_fnc_directCall;
