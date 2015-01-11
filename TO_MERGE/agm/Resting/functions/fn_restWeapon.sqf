/*
 * Author: KoffeinFlummi, edited by commy2
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

#define RESTEDRECOIL 0.6
#define BIPODRECOIL 0.3
#define MAXDISTANCE 1
#define MAXANGLE 15
#define MAXHEIGHT 0.45
#define CAMSHAKE [1,0.5,5]

private ["_unit", "_vehicle", "_weapon"];

_unit = _this select 0;
_vehicle = _this select 1;
_weapon = _this select 2;

if (_weapon != primaryWeapon _unit) exitWith {};

// UNREST THE WEAPON
private "_fnc_unRestWeapon";

_fnc_unRestWeapon = {
  addCamShake CAMSHAKE;

  private "_animation";
  _animation = animationState _unit;

  if (_unit getVariable ["AGM_bipodDeployed", false]) then {
    _unit setUnitRecoilCoefficient (unitRecoilCoefficient _unit / BIPODRECOIL);
    if (_animation find "_agm_deploy" != -1) then {
      //[_unit, [_animation, "_agm_deploy", ""] call CBA_fnc_replace, 2] call AGM_Core_fnc_doAnimation;
      _unit switchMove ([_animation, "_agm_deploy", ""] call CBA_fnc_replace);
    };

    private "_picture";
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    [localize "STR_AGM_Resting_BipodUndeployed", _picture] call AGM_Core_fnc_displayTextPicture;

  } else {
    _unit setUnitRecoilCoefficient (unitRecoilCoefficient _unit / RESTEDRECOIL);
    if (_animation find "_agm_rested" != -1) then {
      //[_unit, [_animation, "_agm_rested", ""] call CBA_fnc_replace, 2] call AGM_Core_fnc_doAnimation;
      _unit switchMove ([_animation, "_agm_rested", ""] call CBA_fnc_replace);
    };

    private "_picture";
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    [localize "STR_AGM_Resting_WeaponLifted", _picture] call AGM_Core_fnc_displayTextPicture;
  };

  _unit setVariable ["AGM_weaponRested", false];
  _unit setVariable ["AGM_bipodDeployed", false];
};

if (_unit getVariable ["AGM_weaponRested", false]) exitWith {call _fnc_unRestWeapon};

// exit if this is not an available animation
if (!isClass (configFile >> "CfgMovesMaleSdr" >> "States" >> format ["%1_agm_deploy", animationState _unit])) exitWith {};

// PREPARE INTERSECTS
private "_fnc_getIntersection";

_fnc_getIntersection = {
  private ["_weaponPos", "_weaponDir", "_weaponPosDown"];

  _weaponPos = ATLtoASL (_unit modelToWorld (_unit selectionPosition "RightHand"));
  _weaponDir = _unit weaponDirection _weapon;
  _weaponPosDown = _weaponPos vectorAdd [0,0,-MAXHEIGHT];

  private ["_checkPosMiddle", "_checkPosLeft", "_checkPosRight", "_checkPosDown"];

  _checkPosMiddle = [
    (_weaponPos select 0) + MAXDISTANCE * (_weaponDir select 0),
    (_weaponPos select 1) + MAXDISTANCE * (_weaponDir select 1),
    (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2)
  ];
  _checkPosLeft = [
    (_weaponPos select 0) + MAXDISTANCE * sin (((_weaponDir select 0) atan2 (_weaponDir select 1)) + 360 - MAXANGLE),
    (_weaponPos select 1) + MAXDISTANCE * cos (((_weaponDir select 0) atan2 (_weaponDir select 1)) + 360 - MAXANGLE),
    (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2)
  ];
  _checkPosRight = [
    (_weaponPos select 0) + MAXDISTANCE * sin (((_weaponDir select 0) atan2 (_weaponDir select 1)) + MAXANGLE),
    (_weaponPos select 1) + MAXDISTANCE * cos (((_weaponDir select 0) atan2 (_weaponDir select 1)) + MAXANGLE),
    (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2)
  ];
  _checkPosDown = [
    (_weaponPos select 0) + MAXDISTANCE * (_weaponDir select 0),
    (_weaponPos select 1) + MAXDISTANCE * (_weaponDir select 1),
    (_weaponPos select 2) + MAXDISTANCE * (_weaponDir select 2) - MAXHEIGHT
  ];

  /* UNCOMMENT THIS FOR DEBUGGING
  weaponPos = ASLtoATL _weaponPos;
  weaponPosDown = ASLtoATL _weaponPosDown;
  checkPosMiddle = ASLtoATL _checkPosMiddle;
  checkPosLeft = ASLtoATL _checkPosLeft;
  checkPosRight = ASLtoATL _checkPosRight;
  checkPosDown = ASLtoATL _checkPosDown;

  onEachFrame {
    drawLine3D [weaponPos, checkPosMiddle, [1,0,0,1]];
    drawLine3D [weaponPos, checkPosLeft, [1,0,0,1]];
    drawLine3D [weaponPos, checkPosRight, [1,0,0,1]];
    drawLine3D [weaponPosDown, checkPosDown, [1,0,0,1]];
  };*/

  private ["_intersectsMiddle", "_intersectsLeft", "_intersectsRight", "_intersectsDown"];

  _intersectsMiddle = lineIntersects [_weaponPos, _checkPosMiddle];
  _intersectsLeft = lineIntersects [_weaponPos, _checkPosLeft];
  _intersectsRight = lineIntersects [_weaponPos, _checkPosRight];
  _intersectsDown = lineIntersects [_weaponPos, _checkPosDown] || {terrainIntersectASL [_weaponPosDown, _checkPosDown]};

  [_intersectsMiddle, _intersectsLeft, _intersectsRight, _intersectsDown]
};

// CHECK FOR APPROPRIATE SURFACE
private "_intersects";

_intersects = call _fnc_getIntersection;

if (true in _intersects) then {
  _unit setVariable ["AGM_weaponRested", true];

  private "_restedPosition";
  _restedPosition = getPosASL _unit;

  // REST THE WEAPON
  addCamShake CAMSHAKE;

  if ([_weapon] call AGM_Resting_fnc_hasBipod && {_intersects select 3}) then {
    _unit setVariable ["AGM_bipodDeployed", true];

    _unit setUnitRecoilCoefficient (BIPODRECOIL * unitRecoilCoefficient _unit);
    //[_unit, format ["%1_agm_deploy", animationState _unit], 2] call AGM_Core_fnc_doAnimation;
    _unit switchMove format ["%1_agm_deploy", animationState _unit];

    private "_picture";
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    [localize "STR_AGM_Resting_BipodDeployed", _picture] call AGM_Core_fnc_displayTextPicture;

  } else {
    _unit setVariable ["AGM_bipodDeployed", false];

    _unit setUnitRecoilCoefficient (RESTEDRECOIL * unitRecoilCoefficient _unit);
    //[_unit, format ["%1_agm_rested", animationState _unit], 2] call AGM_Core_fnc_doAnimation;
    _unit switchMove format ["%1_agm_rested", animationState _unit];

    private "_picture";
    _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");
    [localize "STR_AGM_Resting_WeaponRested", _picture] call AGM_Core_fnc_displayTextPicture;
  };

  // CHECK FOR PLAYER MOVING AWAY, CHANGING WEAPONS ETC
  [_unit, _vehicle, _weapon, _fnc_unRestWeapon, _fnc_getIntersection, _restedPosition] spawn {
    _unit = _this select 0;
    _vehicle = _this select 1;
    _weapon = _this select 2;
    _fnc_unRestWeapon = _this select 3;
    _fnc_getIntersection = _this select 4;
    _restedPosition = _this select 5;

    while {_unit getVariable ["AGM_weaponRested", false]} do {
      _intersects = call _fnc_getIntersection;

      if (
        _unit != AGM_player
        || {_vehicle != vehicle _unit}
        || {inputAction "reloadMagazine" != 0}
        || {weaponLowered _unit}
        || {speed _unit > 1}
        || {currentWeapon _unit != _weapon}
        || {getPosASL _unit distanceSqr _restedPosition > 1}
        || {!(true in _intersects)}
      ) exitWith {call _fnc_unRestWeapon};

      sleep 0.3;
    };
  };
};
