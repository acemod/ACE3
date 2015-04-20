/*
 * Author: ACE2 Team
 *
 * Updates wind, gusts and waves based on ACE_wind
 *
 * Argument:
 * Nothing
 *
 * Return value:
 * Nothing
 */
#include "script_component.hpp"

ACE_wind = [] call FUNC(getWind);
setWind [ACE_wind select 0, ACE_wind select 1, true];
2 setGusts 0;

// Set waves: 0 when no wind, 1 when wind >= 16 m/s
1 setWaves (((vectorMagnitude ACE_wind) / 16.0) min 1.0);

//hintSilent format["Wind: %1\nACE_wind: %2\nDeviation: %3 (m/s)", wind, ACE_wind, Round((vectorMagnitude (ACE_wind vectorDiff wind)) * 1000) / 1000];
