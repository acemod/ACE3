/*
 * Author: KoffeinFlummi, edited by commy2 and CAA-Picard
 *
 * Rests the player's weapon if possible.
 *
 * Arguments:
 * None
 *
 * Return Values:
 * None
 *
 */
#include "script_component.hpp"

EXPLODE_3_PVT(_this,_unit,_vehicle,_weapon);

if (_weapon != primaryWeapon _unit) exitWith {};

if (_unit getVariable ["ACE_weaponRested", false]) exitWith {_this call FUNC(unRestWeapon)};

// exit if this is not an available animation
if (!isClass (configFile >> "CfgMovesMaleSdr" >> "States" >> format ["%1_ace_deploy", animationState _unit])) exitWith {};

// CHECK FOR APPROPRIATE SURFACE
private "_intersects";
_intersects = _this call FUNC(getIntersection);

if (true in _intersects) then {
  _unit setVariable ["ACE_weaponRested", true];

  private "_restedPosition";
  _restedPosition = getPosASL _unit;

  // REST THE WEAPON
  addCamShake CAMSHAKE;
  playSound QGVAR(rest);

  if ([_weapon] call FUNC(hasBipod) && {_intersects select 3}) then {
    _unit setVariable ["ACE_bipodDeployed", true];

    _unit setUnitRecoilCoefficient (BIPODRECOIL * unitRecoilCoefficient _unit);
    //[_unit, format ["%1_ace_deploy", animationState _unit], 2] call EFUNC(common,doAnimation);
    _unit switchMove format ["%1_ace_deploy", animationState _unit];

    private "_picture";
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    [localize "STR_ACE_Resting_BipodDeployed", _picture] call EFUNC(common,displayTextPicture);

  } else {
    _unit setVariable ["ACE_bipodDeployed", false];

    _unit setUnitRecoilCoefficient (RESTEDRECOIL * unitRecoilCoefficient _unit);
    //[_unit, format ["%1_ace_rested", animationState _unit], 2] call EFUNC(common,doAnimation);
    _unit switchMove format ["%1_ace_rested", animationState _unit];

    private "_picture";
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    [localize "STR_ACE_Resting_WeaponRested", _picture] call EFUNC(common,displayTextPicture);
  };

  // Launch a PFH to check for player moving away, changing weapon, etc
  [FUNC(pfhCheckRest), 0.2, [_unit, _vehicle, _weapon, _restedPosition] ] call CBA_fnc_addPerFrameHandler;
};
