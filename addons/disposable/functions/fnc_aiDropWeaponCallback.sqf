/*
* Author: bux, commy2
*
* Remove the ai's missle launcher tube 
*
* Return value:
* Nothing
*/

#include "script_component.hpp"

private ["_unit", "_tube", "_projectile", "_logic"];

_unit = (_this select 0) select 0;
_tube = (_this select 0) select 1;
_projectile = (_this select 0) select 2;

if (!isNull _projectile) exitWith {};

//remove frameEH
[(_this select 1)] call cba_fnc_removePerFrameHandler;

if ([_unit] call EFUNC(common,isPlayer)) exitWith {}; //Just in case a player took control
if (!alive _unit) exitWith {}; //No point doing this for dead

//If AI still has tube, throw it on ground
if (secondaryWeapon _unit == _tube) then {
  _logic = createVehicle ["GroundWeaponHolder", position _unit, [], 0, "CAN_COLLIDE"];
  _logic addWeaponCargoGlobal [_tube, 1];  // @todo secondary weapon items

  _unit removeWeaponGlobal _tube;
};
