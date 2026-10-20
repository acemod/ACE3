#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Enables autofire mode for the turret.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_autofire_enable
 *
 * Public: No
 */
params ["_csw"];
TRACE_1("enabling autofire",_csw);
_csw setVariable [QGVAR(autofire), true, true];
