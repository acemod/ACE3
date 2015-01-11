#define AVERAGEDURATION 6
#define INTERVAL 0.25
#define MAXVIRTUALG 5.4

if !(hasInterface) exitWith {};

AGM_GForces = [];
AGM_GForces_Index = 0;

AGM_GForces_CC = ppEffectCreate ["ColorCorrections", 4215];
AGM_GForces_CC ppEffectEnable true;
AGM_GForces_CC ppEffectForceInNVG true;
AGM_GForces_CC ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
AGM_GForces_CC ppEffectCommit 0.4;

0 spawn {
  while {True} do {
    _player = AGM_player;

    if !((vehicle _player isKindOf "Air") or ((getPos _player select 2) > 5)) then {
      AGM_GForces = [];
      AGM_GForces_Index = 0;
      waitUntil {sleep 5; (vehicle _player isKindOf "Air") or ((getPos _player select 2) > 5)};
    };

    _oldVel = velocity (vehicle _player);
    sleep INTERVAL;
    _newVel = velocity (vehicle _player);

    _accel = ((_newVel vectorDiff _oldVel) vectorMultiply (1 / INTERVAL)) vectorAdd [0, 0, 9.8];
    AGM_GForce_Current = (_accel vectorDotProduct vectorUp (vehicle _player)) / 9.8;

    // Cap maximum G's to +- 10 to avoid g-effects when the update is low fps.
    AGM_GForce_Current = (AGM_GForce_Current max -10) min 10;

    AGM_GForces set [AGM_GForces_Index, AGM_GForce_Current];
    AGM_GForces_Index = (AGM_GForces_Index + 1) % round (AVERAGEDURATION / INTERVAL);
  };
};


/*
 * source: http://en.wikipedia.org/wiki/G-LOC
 * untrained persons without gsuit will fall unconscious between 4 and 6G
 * pilots in gsuits will sustain up to 9G
 * a person is for average 12 seconds unconscious
 * after being unconscious, a person is unable to do simple tasks for average 15 seconds
 *
 * _upTolerance converts the effective 9G of a pilot to virtual 5.4G (= 0.8*0.75*9G)
 * pilots with gsuit will get unconscious at an _average of 9G
 * normal men without gsuit will get unconscious at an _average of 5.4G
 */

0 spawn {
  while {True} do {
    sleep INTERVAL;
    _player = AGM_player;

    _average = 0;
    if (count AGM_GForces > 0) then {
      _sum = 0;
      {
        _sum = _sum + _x;
      } forEach AGM_GForces;
      _average = _sum / (count AGM_GForces);
    };

    _downTolerance = _player getVariable ["AGM_GForceCoef",
      getNumber (configFile >> "CfgVehicles" >> (typeOf _player) >> "AGM_GForceCoef")];
    _upTolerance = _downTolerance * getNumber (configFile >> "CfgWeapons" >> (uniform _player) >> "AGM_GForceCoef");

    ["GForces", [_average, _upTolerance], {format ["_g _avgG _avgG*_upTol: %1, %2, %3", AGM_GForce_Current, _this select 0, (_this select 0) * (_this select 1)]}] call AGM_Debug_fnc_log;

    if (((_average * _upTolerance) > MAXVIRTUALG) and {isClass (configFile >> "CfgPatches" >> "AGM_Medical") and {!(_player getVariable ["AGM_isUnconscious", false])}}) then {
      [_player, (10 + floor(random 5))] call AGM_Medical_fnc_knockOut;
    };

    if ((abs _average > 2) and !(_player getVariable ["AGM_isUnconscious", false])) then {
      if (_average > 0) then {
        _strength = 1.2 - (((_average - 2) * _upTolerance) / (MAXVIRTUALG - 2));
        AGM_GForces_CC ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[_strength,_strength,0,0,0,0.1,0.5]];
        addCamShake [((abs _average) - 2) / 3, 1, 15];
      } else {
        _strength = 1.2 - ((((-1 * _average) - 2) * _downTolerance) / (MAXVIRTUALG - 2));
        AGM_GForces_CC ppEffectAdjust [1,1,0,[1,0.2,0.2,1],[0,0,0,0],[1,1,1,1],[_strength,_strength,0,0,0,0.1,0.5]];
        addCamShake [((abs _average) - 2) / 5, 1, 15];
      };
    } else {
      AGM_GForces_CC ppEffectAdjust [1,1,0,[0,0,0,1],[0,0,0,0],[1,1,1,1],[10,10,0,0,0,0.1,0.5]];
    };

    AGM_GForces_CC ppEffectCommit INTERVAL;
  };
};
