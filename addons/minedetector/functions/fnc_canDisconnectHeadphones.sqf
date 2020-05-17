#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Check if headphones can be disconnected from the mine detector
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can be disconnected <BOOL>
 *
 * Example:
 * [] call ace_minedetector_fnc_canDisconnectHeadphones
 *
 * Public: No
 */

(ACE_player getVariable [QGVAR(isUsingHeadphones), false]) &&
{[ACE_player] call FUNC(hasDetector)};
