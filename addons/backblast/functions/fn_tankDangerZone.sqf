// by commy2

#define BARREL_MUZZLE "usti hlavne"

_unit = _this select 0;
_vehicle = vehicle (_this select 1);
_distance = _this select 2;
_weapon = _this select 3;

if (vehicle _unit != _unit || {!([gunner _firer] call AGM_Core_fnc_isPlayer)}) exitWith {};

_dangerZoneAngle = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_DangerZone_Angle") / 2;
_dangerZoneRange = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_DangerZone_Range");
_dangerZoneDamage = getNumber (configFile >> "CfgWeapons" >> _weapon >> "AGM_DangerZone_Damage");

_position = ATLToASL (_vehicle modelToWorld (_vehicle selectionPosition BARREL_MUZZLE));
_direction = _vehicle weaponDirection _weapon;

if (_unit != _vehicle) then {
  _azimuth = (_direction select 0) atan2 (_direction select 1);
  _inclination = asin (_direction select 2);

  _relativePosition = eyePos _unit;
  _relativeDirection = _relativePosition vectorDiff _position;

  _relativeAzimuth = (_relativeDirection select 0) atan2 (_relativeDirection select 1);
  _relativeInclination = asin (_relativeDirection select 2);

  _angle = sqrt ((_relativeAzimuth - _azimuth) ^ 2 + (_relativeInclination - _inclination) ^ 2);
  _distance = vectorMagnitude _relativeDirection;

  _line = [_position, _relativePosition];

  if (_angle < _dangerZoneAngle && {_distance < _dangerZoneRange} && {!lineIntersects (_line + [_vehicle])} && {!terrainIntersectASL _line}) then {
    _alpha = sqrt (1 - _distance / _dangerZoneRange);
    _beta = sqrt (1 - _angle / _dangerZoneAngle);

    _damage = 2 * _alpha * _beta * _dangerZoneDamage;
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
