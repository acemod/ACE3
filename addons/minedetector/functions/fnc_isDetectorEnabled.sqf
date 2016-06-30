/*
 * Author: Glowbal
 * Check if the mine detector is enabled
 *
 * Arguments:
 * 0: detecter type <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["example"] call ace_minedetector_fnc_[functionName]
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_unit", "_detectorType"];

alive _unit && {(_unit getVariable [format[QGVAR(enable_%1), _detectorType], false])};
