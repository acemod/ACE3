/*
 * Author: commy2
 *
 * The unit will put its current weapon away.
 *
 * Argument:
 * 0: What unit should put the current weapon on back? (Object)
 *
 * Return value:
 * None.
 */

private "_player";

_player = _this select 0;

[_player] call AGM_Core_fnc_fixLoweredRifleAnimation;

_player action ["SwitchWeapon", _player, _player, 99];
