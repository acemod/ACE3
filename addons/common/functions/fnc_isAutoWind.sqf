/*
 * Author: commy2
 * Check if wind is set on auto.
 *
 * Arguments
 * None
 *
 * Return Value:
 * This mission has automatic wind? <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

["Mission", "Intel", "windForced"] call FUNC(getNumberFromMissionSQM) != 1 // return
