/*
 * Author: KoffeinFlummi, commy2
 *
 * Handles deafness due to explosions going off near the player.
 *
 * Arguments:
 * -> Explosion Event Handler
 *
 * Return Value:
 * none
 */

private ["_unit", "_damage", "_strength"];

_unit = _this select 0;
_damage = _this select 1;

_strength = (_damage * 2) min 1;
if (_strength < 0.01) exitWith {};

[_unit, _strength] spawn {
  sleep 0.2;
  _this call AGM_Hearing_fnc_earRinging;
};
