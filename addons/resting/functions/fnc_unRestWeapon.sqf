/*
 * Author: KoffeinFlummi, edited by commy2 and CAA-Picard
 *
 * Un Rests the player's weapon
 *
 * Arguments:
 * 0: unit
 * 1: vehicle
 * 2: weapon
 *
 * Return Values:
 * None
 *
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_unit,_vehicle,_weapon);

addCamShake CAMSHAKE;

private "_animation";
_animation = animationState _unit;

if (_unit getVariable ["ACE_bipodDeployed", false]) then {
  _unit setUnitRecoilCoefficient (unitRecoilCoefficient _unit / BIPODRECOIL);
  if (_animation find "_ace_deploy" != -1) then {
    //[_unit, [_animation, "_ace_deploy", ""] call CBA_fnc_replace, 2] call EFUNC(common,doAnimation);
    _unit switchMove ([_animation, "_ace_deploy", ""] call CBA_fnc_replace);
  };

  private "_picture";
  _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
  [localize "STR_ACE_Resting_BipodUndeployed", _picture] call EFUNC(common,displayTextPicture);

} else {
  _unit setUnitRecoilCoefficient (unitRecoilCoefficient _unit / RESTEDRECOIL);
  if (_animation find "_ace_rested" != -1) then {
    //[_unit, [_animation, "_ace_rested", ""] call CBA_fnc_replace, 2] call EFUNC(common,doAnimation);
    _unit switchMove ([_animation, "_ace_rested", ""] call CBA_fnc_replace);
  };

  private "_picture";
  _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
  [localize "STR_ACE_Resting_WeaponLifted", _picture] call EFUNC(common,displayTextPicture);
};

_unit setVariable ["ACE_weaponRested", false];
_unit setVariable ["ACE_bipodDeployed", false];
