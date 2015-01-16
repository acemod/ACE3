/*
 * Author: Commy2 and CAA-Picard
 *
 * Make the player check the temperature of his weapon
 *
 * Arguments:
 * 0: _player
 * 1: _weapon
 *
 * Return Values:
 * None
 *
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_2_PVT(_this,_player,_weapon);

// Play animation and report temperature
_action = getText (configFile >> "CfgWeapons" >> _weapon >> "ACE_checkTemperatureAction");

if (_action == "") then {
  _action = "Gear";
};

_player playActionNow _action;

// Launch a PFH that waits a sec before displaying the temperature
[FUNC(pfhDisplayTemperature), 1.0, [_player, _weapon, diag_tickTime]] call CBA_fnc_addPerFrameHandler;
