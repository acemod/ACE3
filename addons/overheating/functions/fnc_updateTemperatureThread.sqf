#include "script_component.hpp"
/*
 * Author: esteldunedain
 * Update cooldown calculation of all player weapons at regular intervals.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_overheating_fnc_updateTemperatureThread
 *
 * Public: No
 */

private _currentWeapon = currentWeapon ACE_player;
if ((_currentWeapon != "") && {_currentWeapon == primaryWeapon ACE_player || {_currentWeapon == handgunWeapon ACE_player}}) then {
    [ACE_player, _currentWeapon, 0] call FUNC(updateTemperature);
};

// Schedule for execution again after 5 seconds
[DFUNC(updateTemperatureThread), [], 5] call CBA_fnc_waitAndExecute;
