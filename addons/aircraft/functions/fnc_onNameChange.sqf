/*
 * Author: 654wak654
 * Called when current loadout name is changed
 * Prevents default presets from gettings deleted / overwritten
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_aircraft_fnc_onNameChange
 *
 * Public: No
 */
#include "script_component.hpp"

if ((ctrlText 170) in GVAR(defaultLoadoutNames)) then {
    ctrlEnable [180, false];
    ctrlEnable [200, false];
} else {
    ctrlEnable [180, true];
    ctrlEnable [200, true];
};
