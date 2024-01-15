#include "..\script_component.hpp"
#include "..\defines.hpp"
/*
 * Author: Alganthe
 * Handles the previous / next page buttons for stats.
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Stats page <CONTROL>
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

GVAR(currentStatPage) = GVAR(currentStatPage) + ([-1, 1] select _nextPage);

GVAR(statsInfo) params ["", "_panelControl", "_curSel", "_itemCfg"];

[QGVAR(displayStats), [_display, _panelControl, _curSel, _itemCfg]] call CBA_fnc_localEvent;
