#include "script_component.hpp"
/*
 * Author: esteldunedain & drofseh
 * Update .
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_overheating_fnc_updateAmmoTemperatureThread
 *
 * Public: No
 */

private _currentWeapon = currentWeapon ACE_player;
if ((_currentWeapon != "") && {_currentWeapon == primaryWeapon ACE_player || {_currentWeapon == handgunWeapon ACE_player}}) then {
    private _temperature = ACE_player getVariable [format [QGVAR(%1_temp), _currentWeapon], 0];
    [ACE_player, _currentWeapon, _temperature] call FUNC(updateAmmoTemperature);
};

// Schedule for execution again after 1 seconds. A quick loop is needed for ammo temperature in order to have faster cookoffs at higher barrel temps
[DFUNC(updateAmmoTemperatureThread), [], 1] call CBA_fnc_waitAndExecute;
