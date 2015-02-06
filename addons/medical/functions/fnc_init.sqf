/*
 * Author: KoffeinFlummi
 * Initializes unit variables.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * ReturnValue:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_unit"];

_unit = _this select 0;

_unit setVariable [QGVAR(pain), 0, true];
_unit setVariable [QGVAR(morphine), 0, true];
_unit setVariable [QGVAR(bloodVolume), 1, true];
