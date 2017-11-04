/*
 * Author: PabstMirror
 * Module to make an object loadable.
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
 * [logic, [box], true] call ace_cargo_fnc_moduleMakeLoadable
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_objects", "_activated"];
TRACE_3("params",_logic,_objects,_activated);

ACE_DEPRECATED(QFUNC(moduleMakeLoadable),"3.12.0","Eden editor object attributes");

if ((isNull _logic) || {!_activated}) exitWith {};
if (_objects isEqualTo []) exitWith {
    WARNING_1("ace_cargo_fnc_moduleMakeLoadable has no synced objects [%1]", _logic);
};

private _canLoad = _logic getVariable ["canLoad", true];
private _setSize = _logic getVariable ["setSize", 1];
TRACE_2("settings",_canLoad,_setSize);

{
    [_x, _canLoad, _setSize] call FUNC(makeLoadable);
} forEach _objects;
