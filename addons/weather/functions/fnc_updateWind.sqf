/*
 * Author: ACE2 Team, Ruthberg
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

if (!GVAR(syncWind)) exitWith { ACE_wind = wind };

private ["_newWaves"];

ACE_wind = [] call FUNC(getWind);
setWind [ACE_wind select 0, ACE_wind select 1, true];
2 setGusts 0;

// Set waves: 0 when no wind, 1 when wind >= 16 m/s
_newWaves = ((vectorMagnitude ACE_wind) / 16.0) min 1.0;
if (abs(_newWaves - waves) > 0.1) then {
    1 setWaves _newWaves;
};

TRACE_3("Wind/ACE_wind/Deviation(m/s)",wind,ACE_wind,Round((vectorMagnitude (ACE_wind vectorDiff wind)) * 1000) / 1000);
