/*
 * Author: Commy2 and esteldunedain
 * Make the player check the temperature of his weapon
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_2_PVT(_this,_player,_weapon);

private ["_action"];

// Play animation and report temperature
_action = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_checkTemperatureAction");

if (_action == "") then {
  _action = "Gear";
};

_player playActionNow _action;

// Launch a PFH that waits a sec before displaying the temperature
[FUNC(displayTemperature), [_player, _weapon], 1.0, 0] call EFUNC(common,waitAndExecute);
