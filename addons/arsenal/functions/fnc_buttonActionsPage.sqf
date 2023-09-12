#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson
 * Handles the previous / next page buttons for actions
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Actions control <CONTROL>
 * 2: Previous or next <BOOL> (false = previous, true = next)
 *
 * Return Value:
 * None
 *
 * Public: No
*/

params ["_display", "_control", "_nextPage"];

TRACE_1("control enabled", ctrlEnabled _control);
if !(ctrlEnabled _control) exitWith {};

GVAR(currentActionPage) = GVAR(currentActionPage) + ([-1, 1] select _nextPage);

GVAR(actionsInfo) params ["_panelControl", "_curSel", "_itemCfg"];
[QGVAR(displayActions), [_display, _panelControl, _curSel, _itemCfg]] call CBA_fnc_localEvent;
