/*
 * Author: KoffeinFlummi
 *
 * Called when some dude gets shot. Or stabbed. Or blown up. Or pushed off a cliff. Or hit by a car. Or burnt. Or poisoned. Or gassed. Or cut. You get the idea.
 *
 * Arguments:
 * 0: Unit that got hit (Object)
 * 1: Name of the selection that was hit (String); "" for structural damage
 * 2: Amount of damage inflicted (Number)
 * 3: Shooter (Object); Null for explosion damage, falling, fire etc.
 * 4: Projectile (Object or String)
 *
 * Return value:
 * Damage value to be inflicted (optional)
 */

#define UNCONSCIOUSNESSTRESHOLD 0.6

#define PAINKILLERTRESHOLD 0.1
#define PAINLOSS 0.0001

#define BLOODTRESHOLD1 0.35
#define BLOODTRESHOLD2 0
#define BLOODLOSSRATE 0.04

#define ARMOURCOEF 2

private ["_unit", "_selectionName", "_damage", "_source", "_source", "_projectile", "_hitSelections", "_hitPoints", "_newDamage", "_found", "_cache_projectiles", "_cache_hitpoints", "_cache_damages"];

_unit          = _this select 0;
_selectionName = _this select 1;
_damage        = _this select 2;
_source        = _this select 3;
_projectile    = _this select 4;

if (!local _unit) exitWith {nil}; //if not local, then return value shouldn't have any effect

if (typeName _projectile == "OBJECT") then {
  _projectile = typeOf _projectile;
};

// Prevent unnecessary processing
if (damage _unit >= 1) exitWith {};

_unit setVariable ["AGM_isDiagnosed", False, True];

// @todo: figure out if this still applies.

// For some reason, everything is backwards in MP,
// so we need to untangle some things.
// -- seems fixed as of v1.36
/*if (isMultiplayer) then {
  _selectionName = switch (_selectionName) do {
    case "hand_r" : {"leg_l"};
    case "leg_r"  : {"hand_l"};
    case "legs"   : {"hand_r"};
    default         {_selectionName};
  };
};*/

// This seems to only show up in MP too, but since it doesn't
// collide with anything, I'll check it in SP as well.
if (_selectionName == "r_femur_hit") then {
  _selectionName = "leg_r";
};

_hitSelections = ["head", "body", "hand_l", "hand_r", "leg_l", "leg_r"];
_hitPoints = ["HitHead", "HitBody", "HitLeftArm", "HitRightArm", "HitLeftLeg", "HitRightLeg"];

// If the damage is being weird, we just tell it to fuck off.
// (Returning 0 seems to cause issues though, so return 0.01)
if !(_selectionName in (_hitSelections + [""])) exitWith {0.01};

// Calculate change in damage.
_newDamage = _damage - (damage _unit);
if (_selectionName in _hitSelections) then {
  _newDamage = _damage - (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selectionName)));
};

// Finished with the current frame, reset variables
// Note: sometimes handleDamage spans over 2 or even 3 frames.
if (diag_frameno > (_unit getVariable ["AGM_Medical_FrameNo", -3]) + 2) then {
  _unit setVariable ["AGM_Medical_FrameNo", diag_frameno];
  _unit setVariable ["AGM_Medical_isFalling", False];
  _unit setVariable ["AGM_Medical_Projectiles", []];
  _unit setVariable ["AGM_Medical_HitPoints", []];
  _unit setVariable ["AGM_Medical_Damages", []];
  _unit setVariable ["AGM_Medical_PreventDeath", False];
  if (([_unit] call AGM_Core_fnc_isPlayer) or _unit getVariable ["AGM_allowUnconscious", False]) then {
    if (!(_unit getVariable ["AGM_isUnconscious", False]) and
        {_unit getVariable ["AGM_Medical_PreventInstaDeath", AGM_Medical_PreventInstaDeath]}) then {
      _unit setVariable ["AGM_Medical_PreventDeath", True];
    };
    if ((_unit getVariable ["AGM_isUnconscious", False]) and
        {_unit getVariable ["AGM_Medical_PreventDeathWhileUnconscious", AGM_Medical_PreventDeathWhileUnconscious]}) then {
      _unit setVariable ["AGM_Medical_PreventDeath", True];
    };
  };
};

_damage = _damage - _newDamage;

if !(_unit getVariable ["AGM_allowDamage", True]) exitWith {_damage max 0.01};

_newDamage = _newDamage * (_unit getVariable ["AGM_Medical_CoefDamage", AGM_Medical_CoefDamage]);

// Exclude falling damage to everything other than legs; reduce structural damage.
if (((velocity _unit) select 2 < -5) and (vehicle _unit == _unit)) then {
  _unit setVariable ["AGM_Medical_isFalling", True];
};
if (_unit getVariable "AGM_Medical_isFalling" and !(_selectionName in ["", "leg_l", "leg_r"])) exitWith {
  (_unit getHitPointDamage (_hitPoints select (_hitSelections find _selectionName))) max 0.01;
};
if (_unit getVariable "AGM_Medical_isFalling") then {
  _newDamage = _newDamage * 0.7;
};

// Increase damage for kinetic penetrators for people inside vehicles
// to simulate hot spikey things flying around (generally unpleasant).
// (only if AGM_Armour is used)
if (isClass (configFile >> "CfgPatches" >> "AGM_Armour") and _projectile != "" and vehicle _unit != _unit) then {
  _hit = getNumber (configFile >> "CfgAmmo" >> _projectile >> "hit");
  if (_hit >= 100) then {
    _hit = linearConversion [100, 1000, _hit, 0, ARMOURCOEF, True];
    _newDamage = _newDamage * (1 + _hit);
  };
};

// Make sure there's only one damaged selection per projectile per frame.
_cache_projectiles = _unit getVariable "AGM_Medical_Projectiles";
_cache_hitpoints = _unit getVariable "AGM_Medical_HitPoints";
_cache_damages = _unit getVariable "AGM_Medical_Damages";
if (_selectionName != "" and !(_unit getVariable "AGM_Medical_isFalling")) then {
  if (_projectile in _cache_projectiles) then {
    _index = _cache_projectiles find _projectile;
    _otherDamage = (_cache_damages select _index);
    if (_otherDamage > _newDamage) then {
      _newDamage = 0;
    } else {
      _hitPoint = _cache_hitpoints select _index;
      _restore = ((_unit getHitPointDamage _hitPoint) - _otherDamage) max 0;
      _unit setHitPointDamage [_hitPoint, _restore];
      // Make entry unfindable
      _cache_projectiles set [_index, objNull];
      _cache_projectiles pushBack _projectile;
      _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
      _cache_damages pushBack _newDamage;
    };
  } else {
    _cache_projectiles pushBack _projectile;
    _cache_hitpoints pushBack (_hitPoints select (_hitSelections find _selectionName));
    _cache_damages pushBack _newDamage;
  };
};
_unit setVariable ["AGM_Medical_Projectiles", _cache_projectiles];
_unit setVariable ["AGM_Medical_HitPoints", _cache_hitpoints];
_unit setVariable ["AGM_Medical_Damages", _cache_damages];

// we want to move damage to another selection; have to do it ourselves.
// this is only the case for limbs, so this will not impact the killed EH.
if (_selectionName != (_this select 1)) then {
  _unit setHitPointDamage [_hitPoints select (_hitSelections find _selectionName), _damage + _newDamage];
  _newDamage = 0;
};

_damage = _damage + _newDamage;

// Assign orphan structural damage to torso;
// using spawn with custom damage handling here, but since I just
// move damage, this shouldn't be any issue for the Killed EH
_unit spawn {
  sleep 0.001;

  _damagesum = (_this getHitPointDamage "HitHead")
    + (_this getHitPointDamage "HitBody")
    + (_this getHitPointDamage "HitLeftArm")
    + (_this getHitPointDamage "HitRightArm")
    + (_this getHitPointDamage "HitLeftLeg")
    + (_this getHitPointDamage "HitRightLeg");
  if (_damagesum <= 0.06 and (damage _this) > 0.01) then {
    _damage = damage _this;
    _this setDamage 0;
    _this setHitPointDamage ["HitBody", (_damage min 0.89)]; // just to be sure.
  };
};

// Leg & Arm Damage
_legdamage = (_unit getHitPointDamage "HitLeftLeg") + (_unit getHitPointDamage "HitRightLeg");
if (_selectionName == "leg_l") then {
  _legdamage = _damage + (_unit getHitPointDamage "HitRightLeg");
};
if (_selectionName == "leg_r") then {
  _legdamage = (_unit getHitPointDamage "HitLeftLeg") + _damage;
};

_armdamage = (_unit getHitPointDamage "HitLeftArm") + (_unit getHitPointDamage "HitRightArm");
if (_selectionName == "hand_l") then {
  _armdamage = _damage + (_unit getHitPointDamage "HitRightArm");
};
if (_selectionName == "hand_r") then {
  _armdamage = (_unit getHitPointDamage "HitLeftArm") + _damage;
};

[_unit, _legdamage, _armdamage] call AGM_Medical_fnc_checkDamage;

// Unconsciousness
if (_selectionName == "" and
    _damage >= UNCONSCIOUSNESSTRESHOLD and
    _damage < 1 and
    !(_unit getVariable ["AGM_isUnconscious", False]
  )) then {
  // random chance to kill AI instead of knocking them out, otherwise
  // there'd be shittons of unconscious people after every firefight,
  // causing executions. And nobody likes executions.
  if (_unit getVariable ["AGM_allowUnconscious", ([_unit] call AGM_Core_fnc_isPlayer) or random 1 > 0.5]) then {
    [_unit] call AGM_Medical_fnc_knockOut;
  } else {
    _damage = 1;
  };
};

// Bleeding
if (_selectionName == "" and damage _unit == 0) then {
  _unit spawn {
    while {damage _this > 0 and damage _this < 1} do {
      if !([_this] call AGM_Medical_fnc_isInMedicalVehicle) then {
        _blood = _this getVariable ["AGM_Blood", 1];
        _blood = _blood - BLOODLOSSRATE * (_this getVariable ["AGM_Medical_CoefBleeding", AGM_Medical_CoefBleeding]) * (damage _this);
        _this setVariable ["AGM_Blood", _blood max 0, true];
        if (_blood <= BLOODTRESHOLD1 and !(_this getVariable ["AGM_isUnconscious", False])) then {
          [_this] call AGM_Medical_fnc_knockOut;
        };
        if (_blood <= BLOODTRESHOLD2 and {!AGM_Medical_PreventDeathWhileUnconscious}) then {
          //_this setDamage 1;
          _this setHitPointDamage ["HitHead", 1]; // fx: don't get the uniform bloody if there are no wounds
        };
      };
      sleep 10;
    };
  };
};

// Pain Reduction
if (_unit getVariable ["AGM_Pain", 0] == 0) then {
  _unit spawn {
    while {_this getVariable ["AGM_Pain", 0] > 0} do {
      sleep 1;
      _pain = ((_this getVariable ["AGM_Pain", 0]) - 0.001) max 0;
      _this setVariable ["AGM_Pain", _pain, True];
    };
  };
};
// Set Pain
_potentialPain = _damage * (_unit getVariable ["AGM_Painkiller", 1]);
if ((_selectionName == "") and (_potentialPain > _unit getVariable ["AGM_Pain", 0])) then {
  _unit setVariable ["AGM_Pain", (_damage * (_unit getVariable ["AGM_Painkiller", 1])) min 1, True];
};

// again, using spawn, but there shouldn't be any death, so the killed EH should be fine.
if ((_unit getVariable "AGM_Medical_PreventDeath") and {vehicle _unit != _unit} and {damage (vehicle _unit) >= 1}) then {
  _unit setPosATL [
    (getPos _unit select 0) + (random 3) - 1.5,
    (getPos _unit select 1) + (random 3) - 1.5,
    0
  ];
  if !(_unit getVariable ["AGM_isUnconscious", False]) then {
    [_unit] call AGM_Medical_fnc_knockOut;
  };
  _unit setVariable ["AGM_allowDamage", False];
  _unit spawn {
    sleep 1;
    _this setVariable ["AGM_allowDamage", True];
  };
};

if ((_unit getVariable "AGM_Medical_PreventDeath")) then {
  if ((_damage > 0.89) && (_selectionName in ["", "head", "body"])) then { //only change damage on hits that would be lethal
    _damage = 0.89;
    [_unit, "preventedDeath", [_unit]] call AGM_Core_fnc_callCustomEventHandlersGlobal;
    if (!(_unit getVariable ["AGM_isUnconscious", False])) then {
      [_unit] call AGM_Medical_fnc_knockOut; //knockOut when taking damage that should be lethal
    };
  };
};

_damage
