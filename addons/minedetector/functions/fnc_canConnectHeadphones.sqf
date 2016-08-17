/*
 * Author: esteldunedain
 * Check if headphones can be connected to the mine detector
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can be connected <BOOL>
 *
 * Example:
 * [] call ace_minedetector_fnc_canConnectHeadphones
 *
 * Public: No
 */

#include "script_component.hpp"

!(ACE_player getVariable [QGVAR(isUsingHeadphones), false]) &&
{[ACE_player] call FUNC(hasDetector)};
