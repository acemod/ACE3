/*
 * Author: KoffeinFlummi
 *
 * Handles all incoming damage for vehicles.
 *
 * Arguments:
 * HandleDamage EH
 *
 * Return Value:
 * Damage to be inflicted.
 */

_vehicle       = _this select 0;
_selectionName = _this select 1;
_damage        = _this select 2;
_source        = _this select 3;
_projectile    = _this select 4;

if (typeName _projectile == "OBJECT") then {
  _projectile = typeOf _projectile;
};

// It's already dead, who cares?
if (damage _vehicle >= 1) exitWith {};

// Find out what hitpoint the selection belongs to.
_hitpoint = [_vehicle, _selectionName] call AGM_Armour_fnc_getHitPointBySelection;

// Determine type of vehicle and whether the selection is critical.
_type = "";
_critical = True;
if (_vehicle isKindOf "Car_F") then {
  if (_vehicle isKindOf "Wheeled_APC_F") then {
    _type = "tank";
  } else {
    _type = "car";
  };
  _critical = _hitpoint in ["HitHull", "HitFuel", ""];
};
if (_vehicle isKindOf "Tank_F") then {
  _type = "tank";
  _critical = _hitpoint in ["HitHull", ""];
};
if (_vehicle isKindOf "Helicopter") then {
  _type = "heli";
  _critical = _hitpoint in ["HitHull", ""];
};
if (_vehicle isKindOf "Plane") then {
  _type = "plane";
  _critical = _hitpoint in ["HitHull", ""];
};
if (_vehicle isKindOf "Ship_F") then {
  _type = "ship";
  _critical = _hitpoint in ["HitHull", ""];
};
if (_vehicle isKindOf "StaticWeapon") then {
  _type = "static";
  _critical = _hitpoint in ["HitHull", ""];
};

// Are we doing anything with this type of vehicle?
if !(_type in ["tank", "car"]) exitWith {};

// Change in damage
_newDamage = _damage - (_vehicle getHit _selectionName);

// Prevent total destruction of car unless round used is explosive
if (_type == "car") exitWith {
  if (!_critical or (getNumber (configFile >> "CfgAmmo" >> _projectile >> "explosive") > 0.5)) then {
    if (!(_vehicle getVariable ["AGM_Armour_isEngineSmoking", False]) and _hitpoint == "HitEngine" and _damage > 0.9) then {
      _vehicle setVariable ["AGM_Armour_isEngineSmoking", True, True];
      _pos = [
        0,
        (((boundingBoxReal _vehicle) select 1) select 1) - 4,
        (((boundingBoxReal _vehicle) select 0) select 2) + 2
      ];
      _smoke = "#particlesource" createVehicle [0,0,0];
      _smoke setParticleClass "ObjectDestructionSmoke1_2Smallx";
      _smoke attachTo [_vehicle, _pos];
      [_vehicle, _smoke] spawn {
        _vehicle = _this select 0;
        _smoke = _this select 1;
        _time = time;
        waitUntil {sleep 5; isNull _vehicle or !(alive _vehicle) or ((_vehicle getHitPointDamage "HitEngine") < 0.9) or (_time + 240 < time)};
        deleteVehicle _smoke;
      };
    };
    _damage
  } else {
    _damage min 0.89
  };
};

// Prevent total destruction of tank unless ammo storage is hit
if (_type == "tank") exitWith {

  // Determine ammo storage location
  _target = getText (configFile >> "CfgVehicles" >> typeOf _vehicle >> "AGM_Armour_AmmoLocation");

  // Ammo was hit, high chance for cook-off
  if (_hitpoint == _target and _damage > 0.5 and random 1 > 0.3) then {
    [_vehicle] call AGM_Armour_fnc_cookOff;
  };

  // Ammo wasn't hit, slim chance for cook-off (only for high-damage weapons)
  if (_hitpoint != target and _hitpoint in ["HitBody", "HitTurret", ""] and _newDamage > (0.6 + random 0.3)) then {
    [_vehicle] call AGM_Armour_fnc_cookOff;
  };

  // Prevent destruction, let cook-off handle it if necessary
  if (_critical) then {
    _damage min 0.89
  } else {
    _damage
  };
};

// this shouldn't happen, but who knows
_damage
