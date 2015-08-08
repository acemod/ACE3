/*
 * Author: commy2
 *
 * Check if wind is set on auto.
 *
 * Arguments:
 * None.
 *
 * Return Value:
 * This mission has automatic wind? (Bool)
 *
 * Public: No
 */
#include "script_component.hpp"

["Mission", "Intel", "windForced"] call FUNC(getNumberFromMissionSQM) != 1
