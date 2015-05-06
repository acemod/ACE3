/*
 * Author: commy2
 * Disables firing while the menu is opened. Called from playerChanged eh.
 *
 * Argument:
 * 0: New unit to add the addAction eh <OBJECT>
 * 1: Old unit to remove the addAction eh <STRING>
 *
 * Return value:
 * None
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_newUnit,_oldUnit);

// add to new unit
private "_ehid";
_ehid = [_newUnit, "DefaultAction", {GVAR(openedMenuType) >= 0}, {
    if (!GVAR(actionOnKeyRelease) && GVAR(actionSelected)) then {
        [GVAR(openedMenuType),true] call FUNC(keyUp);
    };
}] call EFUNC(common,addActionEventHandler);

_newUnit setVariable [QGVAR(AAEHID), _ehid];

// remove from old unit
_ehid = _oldUnit getVariable [QGVAR(AAEHID), -1];

[_oldUnit, "DefaultAction", _ehid] call EFUNC(common,removeActionEventHandler);

_oldUnit setVariable [QGVAR(AAEHID), -1];
