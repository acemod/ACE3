#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns whether or not autofire can be enanbled on the gun.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * If autofire can be enabled <BOOL>
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_autofire_canEnable
 *
 * Public: No
 */
params ["_csw"];
!(_csw getVariable [QGVAR(autofire), false])
