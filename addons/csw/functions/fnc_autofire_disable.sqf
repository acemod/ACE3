#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Disable autofire mode for the turret.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_autofire_disable
 *
 * Public: No
 */
params ["_csw"];
TRACE_1("disabling autofire",_csw);
_csw setVariable [QGVAR(autofire), false, true];
