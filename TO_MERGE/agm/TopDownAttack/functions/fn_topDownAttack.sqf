// by commy2

if (getNumber (configFile >> "CfgWeapons" >> _this select 1 >> "AGM_enableTopDownAttack") != 1) exitWith {};

_this spawn {
  _projectile = _this select 6;

  if (missionNamespace getVariable ["AGM_TopDownAttack_modeJavelin", 0] == 0) exitWith {};
  _flyInHeight = 100;

  // cursorTarget doesn't work for lockable weapons in fired event handlers
  _target = missionNamespace getVariable ["AGM_TopDownAttack_LockedTarget", objNull];
  AGM_TopDownAttack_LockedTarget = objNull;

  // save values of the auto-guided  missile
  _type = typeOf _projectile;
  _position = position _projectile;
  _vector = [vectorDir _projectile, vectorUp _projectile];
  _velocity = velocity _projectile;

  deleteVehicle _projectile;

  // create new non-guided missile
  _projectile = createVehicle [_type, _position, [], 0, "FLY"];
  _projectile setVectorDirAndUp _vector;
  _projectile setVelocity _velocity;

  // common functions
  _heightStart = getPosASL _projectile select 2;
  _fnc_getHeight = {(getPosASL _this select 2) - _heightStart};

  _fnc_getPitch = {asin (vectorDir _this select 2)};

  _fnc_getHorizontalDistance = {
    private "_v";

    _v = getPosASL (_this select 0) vectorDiff getPosASL (_this select 1);

    sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2)
  };

  _fnc_getDirTo = {
    private "_v";

    _v = getPosASL (_this select 0) vectorFromTo getPosASL (_this select 1);

    (_v select 0) atan2 (_v select 1)
  };

  _getPitchTo = {
    private ["_p", "_v"];

    _p = getPosASL (_this select 1);
    _p set [2, (_p select 2) + 1];

    _v = getPosASL (_this select 0) vectorFromTo _p;

    asin (_v select 2)
  };

  _fnc_changeMissileDirection = {
    private ["_projectile", "_v", "_l", "_r"];

    _projectile = _this select 0;
    _v = _this select 1;

    _l = sqrt ((_v select 0) ^ 2 + (_v select 1) ^ 2);
    _r = -(_v select 2) / _l;

    _projectile setVectorDirAndUp [
      _v,
      [
        (_v select 0) * _r,
        (_v select 1) * _r,
        _l
      ]
    ];
    _projectile setVelocity _v vectorMultiply vectorMagnitude velocity _projectile;
  };

  // init phase
  sleep 0.5;

  // top down attack
  if (!isNil "_flyInHeight") then {
    // premature explosion
    if (!alive _projectile) exitWith {};

    // get in travel height phase, abrupt direction change
    _vector = vectorDir _projectile;
    _vector set [2, 2];
    _vector = vectorNormalized _vector;

    [_projectile, _vector] call _fnc_changeMissileDirection;

    // missile reached travel height, change direction again
    waitUntil {!alive _projectile || {_projectile call _fnc_getHeight > _flyInHeight}};

    // premature explosion2
    if (!alive _projectile) exitWith {};

    // stay in travel height phase, another abrupt direction change
    _vector = vectorDir _projectile;
    _vector set [2, 0];
    _vector = vectorNormalized _vector;

    [_projectile, _vector] call _fnc_changeMissileDirection;

    // no target, self destruct
    if (isNull _target) exitWith {
      sleep 2;
      deleteVehicle _projectile;
    };

    // loop to stay in travel height and correct altitude
    _time = time;
    while {
      alive _projectile
      && {!isNull _target}
      && {[_projectile, _target] call _fnc_getHorizontalDistance > 100}
    } do {
      _height = _projectile call _fnc_getHeight;
      _pitch = _projectile call _fnc_getPitch;

      _dir = ([_projectile, _target] call _fnc_getDirTo) - direction _projectile;
      _up = if (abs (_flyInHeight - _height) < 1) then {
        -_pitch min 10 max -10
      } else {
        ([-20, 20] select (_height < _flyInHeight)) * (time - _time)
      };

      [_projectile, _dir, _up] call AGM_Core_fnc_changeProjectileDirection;

      _time = time;
      sleep 0.05;
    };
  };

  // missile missed target or hit a bird or something
  if (!alive _projectile) exitWith {};

  // allah ackbar, motherfucker
  while {
    alive _projectile
    && {!isNull _target}
  } do {

    // flare near target. Target flare instead if the target isn't a flare already
    // @todo some config values
    if !(_target isKindOf "CMflareAmmo") then {
      _flares = position _target nearObjects ["CMflareAmmo", 10];

      _count = count _flares;
      if (_count > 0) then {
        _target = _flares select floor random _count;
      };
    };

    _height = _projectile call _fnc_getHeight;
    _pitch = _projectile call _fnc_getPitch;

    _dir = ([_projectile, _target] call _fnc_getDirTo) - direction _projectile;
    _up = ([_projectile, _target] call _getPitchTo) - (_projectile call _fnc_getPitch);

    [_projectile, _dir, _up] call AGM_Core_fnc_changeProjectileDirection;

    _time = time;
    sleep 0.05;
  };
};
