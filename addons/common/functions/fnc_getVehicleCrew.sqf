/*
 * Author: commy2
 *
 * Returns array of crew member objects.
 *
 * Argument:
 * 0: Vehicle (Object)
 * 1: Slot types. Can contain "driver", "commander", "gunner", "turret", "cargo" and "ffv". Case sensitive (Array)
 *
 * Return value:
 * Crew (Array)
 */
#include "script_component.hpp"

private ["_crew"];

params ["_vehicle", "_types"];

_crew = [];

// iterate through all crew members
{
  // this unit is in a ffv position. check if we search for ffv.
  if (_x select 4) then {
    if ("ffv" in _types) then {
      _crew pushBack (_x select 0);
    };
  } else {
    // otherwise check if we search for that type. toLower, because fullCrew returns "driver" vs. "Turret".
    if (toLower (_x select 1) in _types) then {
      _crew pushBack (_x select 0);
    };
  };
} forEach fullCrew _vehicle;

_crew
