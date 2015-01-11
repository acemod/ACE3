/*
 * Author: KoffeinFlummi
 *
 * Start a cook-off in the given vehicle.
 *
 * Arguments:
 * 0: Vehicle
 *
 * Return Value:
 * Boom.
 */

if !(local (_this select 0)) then {
  [_this, "AGM_Armour_fnc_cookOff", (_this select 0)] call AGM_Core_fnc_execRemoteFnc;
};

if ((_this select 0) getVariable ["AGM_Armour_isCookingOff", False]) exitWith {};
(_this select 0) setVariable ["AGM_Armour_isCookingOff", True];

_this spawn {
  private ["_vehicle", "_positions", "_onTurret"];

  _vehicle = _this select 0;
  _positions = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Armour_CookOffLocations");
  _onTurret = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Armour_CookOffOnTurret");

  sleep 0.5 + (random 0.3);

  // guesstimate turret center; intersect weapon direction with front axis.
  // if you find a better method, yell at me.
  _gunBeg = _vehicle selectionPosition (getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "gunBeg"));
  _gunEnd = _vehicle selectionPosition (getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "gunEnd"));
  _weaponDir = _gunEnd vectorFromTo _gunBeg; // this may seem counterintuitive, but it's BIS we're talking about.
  _turretAxis = [-1,-1];
  if (abs (_weaponDir select 0) > 0.05 and !(isArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "memoryPointGun"))) then {
    _y = (_gunBeg select 1) - ((_gunBeg select 0) / (_weaponDir select 0)) * (_weaponDir select 1);
    if (_y < 5) then {
      _turretAxis set [0, 0];
      _turretAxis set [1, _y];
    };
  };

  ["Armour", nil, {
    AGM_TurretAxis = _turretAxis;
    addMissionEventHandler ["Draw3D", {
      drawLine3D [(vehicle player) modelToWorld (AGM_TurretAxis + [-5]), (vehicle player) modelToWorld (AGM_TurretAxis + [10]), [1,0,0,1]];
    }];
  }] call AGM_Debug_fnc_log;

  // Smoke out of cannon and hatches
  _smokeBarrel = "#particlesource" createVehicle [0,0,0];
  _smokeBarrel setParticleClass "MediumDestructionSmoke";
  _smokeBarrel attachTo [_vehicle, _vehicle selectionPosition (getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "Turrets" >> "MainTurret" >> "gunBeg"))];

  _smokes = [];
  {
    _position = [
      - (_x select 0),
      - (_x select 2),
      (_x select 1)
    ];
/*    if (_onTurret select _forEachIndex == 1 and _turretAxis select 0 != -1) then {
      _weaponDirDeg = ((_weaponDir select 0) atan2 (_weaponDir select 1)) * -1;
      _posX = (_position select 0) - (_turretAxis select 0);
      _posY = (_position select 1) - (_turretAxis select 1);
      _posNewX = _posX * cos _weaponDirDeg - _posY * sin _weaponDirDeg;
      _posNewY = _posX * sin _weaponDirDeg - _posY * cos _weaponDirDeg;
      _position set [0, _posNewX + (_turretAxis select 0)];
      _position set [1, _posNewY + (_turretAxis select 1)];
    };*/

    _smoke = "#particlesource" createVehicle [0,0,0];
    _smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
    _smoke attachTo [_vehicle, _position];
    _smokes pushBack _smoke;
  } forEach _positions;

  sleep 3 + (random 2);

  // this shit is busy being on fire, can't go driving around all over the place
  _vehicle setFuel 0;

  _light = "#lightpoint" createVehicle [0,0,0];
  _light lightAttachObject [_vehicle, [0,0,4]];

  [_light, "{_this setLightBrightness 0.7; _this setLightAmbient [1,0.4,0.15]; _this setLightColor [1,0.4,0.15];}"] call AGM_Core_fnc_execRemoteFnc;

  // CookOffs
  _fires = [];
  {
    _position = [
      - (_x select 0),
      - (_x select 2),
      (_x select 1)
    ];
    if (_onTurret select _forEachIndex == 1 and _turretAxis select 0 != -1) then {
      _weaponDirDeg = ((_weaponDir select 0) atan2 (_weaponDir select 1)) * -1;
      _posX = (_position select 0) - (_turretAxis select 0);
      _posY = (_position select 1) - (_turretAxis select 1);
      _posNewX = _posX * cos _weaponDirDeg - _posY * sin _weaponDirDeg;
      _posNewY = _posX * sin _weaponDirDeg - _posY * cos _weaponDirDeg;
      _position set [0, _posNewX + (_turretAxis select 0)];
      _position set [1, _posNewY + (_turretAxis select 1)];
    };

    _fire = "#particlesource" createVehicle [0,0,0];
    _fire setParticleClass "AGM_CookOff";
    _fire attachTo [_vehicle, _position];
    _fires pushBack _fire;
  } forEach _positions;

  _sound = createSoundSource ["AGM_Sound_CookOff", getPos _vehicle, [], 0];

  // indicator for the crew - yo, your shit's on fire
  {
    if ([_x] call AGM_Core_fnc_isPlayer) then {
      [[_vehicle], "{(_this select 0) spawn {for '_i' from 0 to 11 do {if (vehicle AGM_player != _this) exitWith {}; [] call BIS_fnc_flamesEffect; sleep 0.4;};};}", _x] call AGM_Core_fnc_execRemoteFnc;
    };
  } forEach (crew _vehicle);

  sleep (4 + random 1);

  deleteVehicle _smokeBarrel;
  [_smokes, {deleteVehicle _this}] call AGM_Core_fnc_map;
  [_fires, {deleteVehicle _this}] call AGM_Core_fnc_map;
  deleteVehicle _light;
  _sound setPosASL [-10000, -10000, 1000]; //deleteVehicle _sound;

  (_this select 0) setVariable ["AGM_Armour_isCookingOff", False];
  if (local _vehicle and damage _vehicle < 1) then {
    _vehicle setDamage 1;
    /* @todo: this is for v0.96
    _turretClass = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Armour_TurretObject");
    if (_turretClass != "") then {
      _turretPos = getArray (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Armour_TurretPosition");
      _position = [
        - (_turretPos select 0),
        - (_turretPos select 2),
        (_turretPos select 1)
      ];
      _turret = _turretClass createVehicle (_vehicle modelToWorld _position);
      // @todo
      //_turret setVectorUp [random 1, random 1, 1];
      //_turret setVelocity [random 7, random 7, 8 + random 5];
    };*/
  };
};
