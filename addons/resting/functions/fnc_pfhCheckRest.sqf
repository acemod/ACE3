/*
 * Author: KoffeinFlummi, edited by commy2 and CAA-Picard
 *
 * PFH that check for player moving away, changing weapon, etc
 * and unrests the weapon if necessary
 *
 * Arguments:
 * 0: unit
 * 1: vehicle
 * 2: weapon
 * 3: rested position
 *
 * Return Values:
 * None
 *
 */
#include "script_component.hpp"

EXPLODE_2_PVT(_this,_params,_pfhId);
EXPLODE_4_PVT(_params,_unit,_vehicle,_weapon,_restedPosition);

if !(_unit getVariable ["ACE_weaponRested", false]) exitWith {
  [_pfhId] call cba_fnc_removePerFrameHandler;
};

private ["_intersects"];
_intersects = _params call FUNC(getIntersection);

if (
  _unit != ACE_player
  || {_vehicle != vehicle _unit}
  || {inputAction "reloadMagazine" != 0}
  || {weaponLowered _unit}
  || {speed _unit > 1}
  || {currentWeapon _unit != _weapon}
  || {getPosASL _unit distanceSqr _restedPosition > 1}
  || {!(true in _intersects)}
) exitWith {
  [_pfhId] call cba_fnc_removePerFrameHandler;
  [_unit, _vehicle, _weapon] call FUNC(unRestWeapon);
};
