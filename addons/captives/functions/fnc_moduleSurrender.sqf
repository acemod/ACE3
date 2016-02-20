/*
 * Author: PabstMirror
 * Module Function to make a unit surrender (can be called from editor)
 *
 * Arguments:
 * 0: The Module Logic <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * Called from module
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

if (!_activated) exitWith {};
if (!isServer) exitWith {};

{
    ["SetSurrendered", [_x], [_x, true]] call EFUNC(common,targetEvent);
} forEach _units;

deleteVehicle _logic;
