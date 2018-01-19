/*
 * Author: Alganthe
 * Handles the previous / next page buttons for stats
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Previous or next <BOOL> (false = previous, true = next)
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display", "_control", "_nextPage"];

TRACE_1("control enabled", ctrlEnabled _control);
if !(ctrlEnabled _control) exitWith {};

GVAR(statsInfo) params ["_isLeftPanel", "_statsIndex", "_panelControl", "_curSel", "_itemCfg"];

private _pageList = [GVAR(statsPagesRight), GVAR(statsPagesLeft)] select (_isLeftPanel);
private _newPageNumber = [(_pageList select _statsIndex) - 1, (_pageList select _statsIndex) + 1] select _nextPage;

_pageList set [_statsIndex, _newPageNumber];

[QGVAR(displayStats), [_display, _panelControl, _curSel, _itemCfg]] call CBA_fnc_localEvent;
