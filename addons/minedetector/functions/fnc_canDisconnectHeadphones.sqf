#include "..\script_component.hpp"
/*
 * Author: esteldunedain
 * Checks if headphones can be disconnected from the mine detector.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can be disconnected <BOOL>
 *
 * Example:
 * player call ace_minedetector_fnc_canDisconnectHeadphones
 *
 * Public: No
 */

params ["_unit"];

(_unit getVariable [QGVAR(isUsingHeadphones), false]) && {_unit call FUNC(hasDetector)} // return
