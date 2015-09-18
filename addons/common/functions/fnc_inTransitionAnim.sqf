/*
 * Author: commy2
 * Check if given unit is in a transitional animation
 *
 * Arguments:
 * 0: A soldier <Object>
 *
 * Return Value:
 * <Bool>
 *
 * Public: Yes
 */
#include "script_component.hpp"

getNumber (configFile >> "CfgMovesMaleSdr" >> "States" >> animationState (_this select 0) >> "looped") == 0
