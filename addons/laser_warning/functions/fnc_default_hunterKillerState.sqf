#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Returns default values for the hunter killer state
 *
 * Arguments:
 * 0: Default Enabled <BOOL>
 *
 * Return Value:
 * Hunter Killer State Array <ARRAY>
 *
 * Example:
 * call ace_laser_warning_fnc_default_hunterKillerState;
 *
 * Public: No
 */
params ["_defaultEnabled"];
[
    _defaultEnabled && ({ ["ace_hunterkiller"] call EFUNC(common,isModLoaded) }),
    true
]