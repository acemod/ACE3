#include "script_component.hpp"
/*
 * Author: commy2
 * Returns array of crew member objects.
 *
 * Arguments:
 * 0: Vehicle <OBJECT>
 * 1: Slot types filter (default: ["driver", "commander", "gunner", "turret", "cargo", "ffv"]) <ARRAY>
 *
 * Return Value:
 * Crew <ARRAY>
 *
 * Example:
 * [car, ["driver"]] call ace_common_fnc_getVehicleCrew
 *
 * Public: Yes
 */

params ["_vehicle", ["_types", ["driver", "commander", "gunner", "turret", "cargo", "ffv"]]];

private _crew = [];

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
    false
} count fullCrew _vehicle;

_crew
