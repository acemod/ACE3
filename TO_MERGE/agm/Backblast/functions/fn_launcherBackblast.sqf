// by commy2

_unit = _this select 0;
_firer = _this select 1;
_distance = _this select 2;
_weapon = _this select 3;

if (vehicle _unit != _unit || {!([_firer] call AGM_Core_fnc_isPlayer)}) exitWith {};

_backblastAngle = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_Backblast_Angle") / 2;
_backblastRange = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_Backblast_Range");
_backblastDamage = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_Backblast_Damage");

_position = eyePos _firer;
_direction = _firer weaponDirection currentWeapon _firer;

if (_unit == _firer) then {
  _distance = [_position, _direction, _backblastRange] call AGM_Backblast_fnc_getDistance;

  if (_distance < _backblastRange) then {
    _alpha = sqrt (1 - _distance / _backblastRange);
    _beta = sqrt 0.5;

    _damage = 2 * _alpha * _beta * _backblastDamage;
    [_damage * 100] call BIS_fnc_bloodEffect;

    if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then {
      [_unit, "HitBody", ([_unit, "", ((_unit getHitPointDamage "HitBody") + _damage), objNull, objNull] call AGM_Medical_fnc_handleDamage)] call AGM_Medical_fnc_setHitPointDamage;
    } else {
      _unit setDamage (damage _unit + _damage);
    };
  };
} else {
  _direction = [0, 0, 0] vectorDiff _direction;

  _azimuth = (_direction select 0) atan2 (_direction select 1);
  _inclination = asin (_direction select 2);

  _relativePosition = eyePos _unit;
  _relativeDirection = _relativePosition vectorDiff _position;

  _relativeAzimuth = (_relativeDirection select 0) atan2 (_relativeDirection select 1);
  _relativeInclination = asin (_relativeDirection select 2);

  _angle = sqrt ((_relativeAzimuth - _azimuth) ^ 2 + (_relativeInclination - _inclination) ^ 2);
  _distance = vectorMagnitude _relativeDirection;

  _line = [_position, _relativePosition];

  if (_angle < _backblastAngle && {_distance < _backblastRange} && {!lineIntersects _line} && {!terrainIntersectASL _line}) then {
    _alpha = sqrt (1 - _distance / _backblastRange);
    _beta = sqrt (1 - _angle / _backblastAngle);

    _damage = 2 * _alpha * _beta * _backblastDamage;
    if (_unit == AGM_player) then {[_damage * 100] call BIS_fnc_bloodEffect};

    if (isClass (configFile >> "CfgPatches" >> "AGM_Medical")) then {
      [_unit, "HitBody", ([_unit, "", ((_unit getHitPointDamage "HitBody") + _damage), objNull, objNull] call AGM_Medical_fnc_handleDamage)] call AGM_Medical_fnc_setHitPointDamage;
      _unit spawn {
        sleep 0.5;
        [_this, "", 0, objNull, objNull] call AGM_Medical_fnc_handleDamage;
      };
    } else {
      _unit setDamage (damage _unit + _damage);
    };
  };
};
