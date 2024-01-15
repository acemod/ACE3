#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Brett Mayson
 * Handles the previous / next page buttons for actions.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Actions page <CONTROL>
 * 2: Previous (false) or next (true) page <BOOL>
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
