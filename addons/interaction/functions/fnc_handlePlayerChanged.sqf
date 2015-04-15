/*
 * Author: commy2
 *
 * Disables firing while the menu is opened. Called from playerChanged eh.
 *
 * Argument:
 * 0: New unit to add the addAction eh (Object)
 * 1: Old unit to remove the addAction eh (String)
 *
 * Return value:
 * NOPE
 */
#include "script_component.hpp"

private ["_newUnit", "_oldUnit"];

_newUnit = _this select 0;
_oldUnit = _this select 1;

// add to new unit
private "_ehid";
_ehid = [_newUnit, "DefaultAction", {EGVAR(interact_menu,openedMenuType) >= 0}, {systemChat "snap"}] call EFUNC(common,addActionEventHandler);

_newUnit setVariable [QGVAR(AAEHID), _ehid];

// remove from old unit
_ehid = _oldUnit getVariable [QGVAR(AAEHID), -1];

[_oldUnit, "DefaultAction", _ehid] call EFUNC(common,removeActionEventHandler);

_oldUnit setVariable [QGVAR(AAEHID), -1];
