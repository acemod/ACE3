#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns if a LWS is powered
 *
 * Arguments:
 * 0: LWS object <OBJECT>
 *
 * Return Value:
 * If LWS is powered <BOOL>
 *
 * Example:
 * call ace_laser_warning_fnc_isLwsPowered;
 *
 * Public: No
 */
params ["_object"];

if !(_object getVariable [QGVAR(enabled), false]) exitWith { false };
(_object getVariable [QGVAR(state_box), false]) params ["_powerState"];
_powerState == POWER_STATE_ON 
