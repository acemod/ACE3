/*
 * Author: commy2
 *
 * Returns the unit that has the given backpack object equipped.
 * 
 * Argument:
 * 0: A backpack object (Object)
 * 
 * Return value:
 * Unit that has the backpack equipped. (Object)
 */

private ["_backpack", "_unit"];

_backpack = _this select 0;

_unit = objNull;
{
  if (backpackContainer _x == _backpack) exitWith {_unit = _x};
} forEach (allUnits + allDeadMen);
_unit
