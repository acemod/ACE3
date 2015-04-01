/*
 * Original Author: Taosenai
 * Adapted By: KoffeinFlummi
 *
 * Animates the scope when firing.
 *
 * Arguments:
 * 0: Unit
 * 1: Weapon
 * 2: Muzzle
 * 3: Mode
 * 4: Ammo
 * 5: Magazine
 * 6: Projectile
 *
 * Return Value:
 * None
 */

if (_this select 0 != AGM_player) exitwith {}; // Sanity check

0 = _this spawn {
  disableSerialization;

  _weaponType = _this select 1;
  _config = configFile >> "CfgWeapons" >> _weaponType;
  _scope = uiNameSpace getVariable "AGM_Optics_Scope";

  // @todo
  _recoilMulti = getNumber (_config >> "tmr_smallarms_recoil_shakeMultiplier"); // Will be 0 if undefined

  if (_recoilMulti == 0) then {
    _recoilMulti = 1;
  };
  if (_recoilMulti > 2.6) then {
    _recoilMulti = 2.6; // Don't get too high
  };

  // Reduce the reticle movement as the player drops into lower, supported stances.
  _detectStance = (player selectionPosition "Neck" select 2);
  if (_detectStance < 1.3) then {
    _recoilMulti = _recoilMulti - 0.10;
  };
  if (_detectStance < 0.7) then {
    _recoilMulti = _recoilMulti - 0.20;
  };

  // Reduce reticle movement if the player is rested (tmr_autorest).
  if (player getVariable ["tmr_autorest_rested", false]) then {
    _recoilMulti = _recoilMulti - 0.20;
  };

  // Reduce reticle movement if the player is deployed (tmr_autorest).
  if (player getVariable ["tmr_autorest_deployed", false]) then {
    _recoilMulti = _recoilMulti - 0.30;
  };
  _recoilMulti = 1;
  // @endtodo


  // Constants which determine how the scope recoils
  _recoilScope = 0.03 * _recoilMulti + random 0.0015;
  _recoilRing = 0.03 * _recoilMulti + random 0.0015;

  _randomScopeShiftX = 0.005 * _recoilMulti - random 0.011;

  _randomReticleShiftX = 0.0036 * _recoilMulti + random 0.0045; // Always tend up and right;
  _randomReticleShiftY = -0.0046 * _recoilMulti - random 0.0055;

  /////////
  // Center everything

  // getResolution select 4 should return the aspect ratio, but it's totally wrong
  // for triple head displays. We'll compute it manually.
  _aspectRatio = (getResolution select 0) / (getResolution select 1);

  _reticleX = (SafeZoneXAbs + SafeZoneWAbs/2 - (SafeZoneWAbs / _aspectRatio)/2);
  _reticleY = SafeZoneY;
  _reticleW = SafeZoneWAbs / _aspectRatio;
  _reticleH = SafeZoneH;

  // Reticle
  (_scope displayCtrl 1) ctrlSetPosition [_reticleX, _reticleY, _reticleW, _reticleH];
  // Reticle night (illum)
  (_scope displayCtrl 2) ctrlSetPosition [_reticleX, _reticleY, _reticleW, _reticleH];

  _bodyX = (SafeZoneXAbs + SafeZoneWAbs/2 - (SafeZoneWAbs / _aspectRatio));
  _bodyY = SafeZoneY - (SafeZoneH/2);
  _bodyW = SafeZoneWAbs / _aspectRatio * 2;
  _bodyH = SafeZoneH * 2;

  // Body night
  (_scope displayCtrl 5) ctrlSetPosition [_bodyX, _bodyY, _bodyW, _bodyH];
  // Body
  (_scope displayCtrl 6) ctrlSetPosition [_bodyX, _bodyY, _bodyW, _bodyH];

  _centerDelay = 0.01;
  (_scope displayCtrl 1) ctrlCommit _centerDelay;
  (_scope displayCtrl 2) ctrlCommit _centerDelay;
  (_scope displayCtrl 5) ctrlCommit _centerDelay;
  (_scope displayCtrl 6) ctrlCommit _centerDelay;

  /////////
  // Create and commit recoil effect

  // Move reticle

  (_scope displayCtrl 1) ctrlSetPosition [_reticleX - (_recoilScope/2) + _randomReticleShiftX, _reticleY - (_recoilScope/2) + _randomReticleShiftY, _reticleW + _recoilScope, _reticleH + _recoilScope];
  (_scope displayCtrl 2) ctrlSetPosition [_reticleX - (_recoilScope/2) + _randomReticleShiftX, _reticleY - (_recoilScope/2) + _randomReticleShiftY, _reticleW + _recoilScope, _reticleH + _recoilScope];

  // Move body

  (_scope displayCtrl 5) ctrlSetPosition [_bodyX - (_recoilScope/2) + _randomScopeShiftX, _bodyY - (_recoilScope/2), _bodyW + _recoilScope, _bodyH + _recoilScope];
  (_scope displayCtrl 6) ctrlSetPosition [_bodyX - (_recoilScope/2) + _randomScopeShiftX, _bodyY - (_recoilScope/2), _bodyW + _recoilScope, _bodyH + _recoilScope];

  _recoilDelay = 0.036;
  _fa = false;
  _cwm = currentWeaponMode player;
  if (_cwm == "FullAuto" || _cwm == "manual" || _cwm == "Burst") then {
    _recoilDelay =  getNumber (_config >> _cwm >> "reloadTime")/2.2;
    _fa = true;
  };
  (_scope displayCtrl 1) ctrlCommit _recoilDelay;
  (_scope displayCtrl 2) ctrlCommit _recoilDelay;
  (_scope displayCtrl 5) ctrlCommit _recoilDelay;
  (_scope displayCtrl 6) ctrlCommit _recoilDelay;

  //////////////

  waituntil {sleep 0.01; ctrlCommitted (_scope displayCtrl 6)};

  //////////////

  //////
  // Bring them all back
  (_scope displayCtrl 1) ctrlSetPosition [_reticleX, _reticleY, _reticleW, _reticleH];
  (_scope displayCtrl 2) ctrlSetPosition [_reticleX, _reticleY, _reticleW, _reticleH];
  (_scope displayCtrl 5) ctrlSetPosition [_bodyX, _bodyY, _bodyW, _bodyH];
  (_scope displayCtrl 6) ctrlSetPosition [_bodyX, _bodyY, _bodyW, _bodyH];

  _recenterDelay = 0.09;
  if (_fa) then {
    _recenterDelay =  getNumber (_config >> _cwm >> "reloadTime")/2.2;
  };
  (_scope displayCtrl 1) ctrlCommit _recenterDelay;
  (_scope displayCtrl 2) ctrlCommit _recenterDelay;
  (_scope displayCtrl 5) ctrlCommit _recenterDelay;
  (_scope displayCtrl 6) ctrlCommit _recenterDelay;
};
