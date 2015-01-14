/*
* Author: commy2
*
* Adjust the grenades throwing direction and speed to the selected throwing mode.
*
* Argument:
* input from "Fired" eventhandler
*
* Return value:
* Nothing
*/

#include "script_component.hpp"

private ["_unit", "_weapon", "_projectile", "_mode", "_fuzeTime"];

_unit = _this select 0;
_weapon = _this select 1;
_projectile = _this select 6;

if (_unit != ACE_player) exitWith {};
if (_weapon != "Throw") exitWith {};

_mode = missionNamespace getVariable [QGVAR(currentThrowMode), 0];

if (_mode != 0) then {
  private "_velocity";

  _velocity = velocity _projectile;

  switch (_mode) do {
    //high throw
  case 1 : {
      _velocity = [
      0.5 * (_velocity select 0),
      0.5 * (_velocity select 1),
      [0, 0, 0] distance (_velocity vectorMultiply 0.5)
      ];
    };
    //precise throw
  case 2 : {
      _velocity = (_unit weaponDirection _weapon) vectorMultiply (vectorMagnitude _velocity);
    };
    //roll grande
  case 3 : {
      //@todo
    };
    //drop grenade
  case 4 : {
      _velocity = [0, 0, 0];
    };
  };

  _projectile setVelocity _velocity;
};

if (typeOf _projectile == "ACE_G_M84") then {
  // _fuzeTime = (configFile >> "CfgAmmo" >> typeOf _projectile >> "fuseDistance");
  _fuzeTime = (configFile >> "CfgAmmo" >> typeOf _projectile >> "explosionTime");  //@toDo pretty sure this should be explosionTime not fuseDistance
  [FUNC(flashbangThrownFuze), 0, [_projectile, (time + _fuzeTime)]] call CBA_fnc_addPerFrameHandler;
};
