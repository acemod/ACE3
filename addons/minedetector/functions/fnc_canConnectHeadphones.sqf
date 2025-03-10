#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Checks if headphones can be connected to the mine detector.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can be connected <BOOL>
 *
 * Example:
 * player call ace_minedetector_fnc_canConnectHeadphones
 *
 * Public: No
 */

params ["_unit"];

!(_unit getVariable [QGVAR(isUsingHeadphones), false]) && {_unit call FUNC(hasDetector)} // return
