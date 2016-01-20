/*
 * Author: esteldunedain
 * Update temperature of a weapon at regular intervals.
 *
 * Argument:
 * None
 *
 * Return value:
 * None
 *
 * Example:
 * [] call ace_overheating_fnc_updateTemperatureThread
 *
 * Public: No
 */
#include "script_component.hpp"

if (primaryWeapon ACE_player != "") then {
    [ACE_player, primaryWeapon ACE_player, 0] call FUNC(updateTemperature);
};
if (handgunWeapon ACE_player != "") then {
    [ACE_player, handgunWeapon ACE_player, 0] call FUNC(updateTemperature);
};
if (secondaryWeapon ACE_player != "") then {
    [ACE_player, secondaryWeapon ACE_player, 0] call FUNC(updateTemperature);
};

// Schedule for execution again after 5 seconds
[DFUNC(updateTemperatureThread), [], 5] call EFUNC(common,waitAndExecute);
