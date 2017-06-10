/*
 * Author: commy2
 * Check if given unit is in a transitional animation
 *
 * Arguments:
 * 0: A soldier <OBJECT>
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * [bob] call ace_common_fnc_inTransitionAnim
 *
 * Public: Yes
 */
#include "script_component.hpp"

getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState (_this select 0) >> "looped") == 0 // return
