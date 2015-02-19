/*
 * Author: Garth 'L-H' de Wet
 * Gets the explosive object or objNull from the speed dial entry.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Speed dial entry <STRING>
 *
 * Return Value:
 * Associated explosive (or ObjNull) <OBJECT>
 *
 * Example:
 * [ace_player, "2113"] call ace_explosives_fnc_getSpeedDialExplosive;
 *
 * Public: Yes
 */
#include "script_component.hpp"
EXPLODE_2_PVT(_this,_unit,_code);
private ["_explosive"];
if (isNil QGVAR(CellphoneIEDs)) exitWith {objNull};
_explosive = objNull;
{
  if ((_x select 1) == _code) exitWith {
    _explosive = _x;
  };
  false
} count GVAR(CellphoneIEDs);
_explosive
