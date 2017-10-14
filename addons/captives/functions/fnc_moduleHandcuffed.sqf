/*
 * Author: PabstMirror
 * Module Function to make a unit handcuffed (can be called from editor)
 * Also used for threeden attribute expression with dummy Logic Object
 *
 * Arguments:
 * 0: The Module Logic <OBJECT>
 * 1: synced objects <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [objNull, [player], true] call ace_captives_fnc_moduleHandcuffed
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

TRACE_3("params",_logic,_units,_activated);

if (!_activated) exitWith {};
if (!isServer) exitWith {};

//Modules run before postInit can instal the event handler, so we need to wait a little bit
[{
    params ["_units"];
    {
        TRACE_2("event",_x,local _x);
        [QGVAR(setHandcuffed), [_x, true], [_x]] call CBA_fnc_targetEvent;
    } forEach _units;
}, [_units], 0.05] call CBA_fnc_waitAndExecute;

if (!isNull _logic) then {
    deleteVehicle _logic;
};
