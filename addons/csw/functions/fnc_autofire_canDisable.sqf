#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns whether or not autofire can be disabled on the gun.
 *
 * Arguments:
 * 0: CSW <OBJECT>
 *
 * Return Value:
 * If autofire can be disabled <BOOL>
 *
 * Example:
 * [cursorObject] call ace_csw_fnc_autofire_canDisable
 *
 * Public: No
 */
params ["_csw"];
(_csw getVariable [QGVAR(autofire), true]) && { !(_csw getVariable [QGVAR(autofire_force), false]) }
