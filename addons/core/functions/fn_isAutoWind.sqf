/*
 * Author: commy2
 *
 * Check if wind is set on auto.
 * 
 * Argument:
 * None.
 * 
 * Return value:
 * This mission has automatic wind? (Bool)
 */

["Mission", "Intel", "windForced"] call GVAR(fnc_getNumberFromMissionSQM) != 1
