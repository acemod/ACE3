// by CAA-Picard

private ["_currentBlood", "_time", "_blind", "_timeBlood", "_strength", "_currentBlood"];

if (!hasInterface) exitWith {};

AGM_Unconscious_CC = ppEffectCreate ["ColorCorrections", 4206];
AGM_Unconscious_CC ppEffectForceInNVG True;
AGM_Unconscious_CC ppEffectAdjust [1,1,0, [0,0,0,1], [0,0,0,0], [1,1,1,1], [0.4,0.4,0,0,0,0.1,0.3]];
AGM_Unconscious_CC ppEffectCommit 0;
AGM_Unconscious_RB = ppEffectCreate ["RadialBlur", 4207];
AGM_Unconscious_RB ppEffectForceInNVG True;
AGM_Unconscious_RB ppEffectAdjust [0.01, 0.01, 0, 0];
AGM_Unconscious_RB ppEffectCommit 0;
AGM_Blinding_CC = ppEffectCreate ["ColorCorrections", 4211];
AGM_Blinding_CC ppEffectForceInNVG True;
AGM_Blinding_CC ppEffectAdjust [1,1,0, [1,1,1,0], [0,0,0,1], [0,0,0,0]];
AGM_Blinding_CC ppEffectCommit 0;

AGM_BloodLevel_CC = ppEffectCreate ["ColorCorrections", 4208];
AGM_BloodLevel_CC ppEffectForceInNVG True;
AGM_BloodLevel_CC ppEffectAdjust [1,1,0, [0,0,0,0], [1,1,1,1], [0.2,0.2,0.2,0]];
AGM_BloodLevel_CC ppEffectCommit 0;

AGM_Pain_CA = ppEffectCreate ["chromAberration", 4209];
AGM_Pain_CA ppEffectForceInNVG True;
AGM_Pain_CA ppEffectAdjust [0, 0, False];
AGM_Pain_CA ppEffectCommit 0;
AGM_Pain_CC = ppEffectCreate ["ColorCorrections", 4210];
AGM_Pain_CC ppEffectForceInNVG True;
AGM_Pain_CC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [1.3,1.3,0,0,0,0.2,2]];
AGM_Pain_CC ppEffectCommit 0;

// Spawn a thread to handle graphical effects for player, regardless of which unit he's controlling
0 spawn {
  _time = time;
  _timeBlood = 0;
  _blind = False;
  while {True} do {
    // Detect if curator interface is open and then disable effects
    if (!isNull(findDisplay 312)) then {
      AGM_BloodLevel_CC ppEffectEnable False;
      AGM_Unconscious_CC ppEffectEnable False;
      AGM_Unconscious_RB ppEffectEnable False;
      AGM_Blinding_CC ppEffectEnable False;
      AGM_Pain_CC ppEffectEnable False;
      AGM_Pain_CA ppEffectEnable False;
      waitUntil {isNull(findDisplay 312)};
    };

    // Detect if player is not alive and then disable effects and enable input
    if (!(alive AGM_player)) then {
      AGM_BloodLevel_CC ppEffectEnable False;
      AGM_Unconscious_CC ppEffectEnable False;
      AGM_Unconscious_RB ppEffectEnable False;
      AGM_Blinding_CC ppEffectEnable False;
      AGM_Pain_CC ppEffectEnable False;
      AGM_Pain_CA ppEffectEnable False;
      if !(isNull (uiNamespace getVariable ["AGM_Core_dlgDisableMouse", displayNull])) then {
        [False] call AGM_Core_fnc_disableUserInput;
      };
      waitUntil {alive AGM_player};
    };

    // Unconciousness Effect
    if (AGM_player getVariable ["AGM_isUnconscious", False]) then {
      AGM_Unconscious_CC ppEffectEnable True;
      AGM_Unconscious_RB ppEffectEnable True;
      _blind = True;
      if (isNull (uiNamespace getVariable ["AGM_Core_dlgDisableMouse", displayNull])) then {
        [True, True] call AGM_Core_fnc_disableUserInput;
      };
    } else {
      AGM_Unconscious_CC ppEffectEnable False;
      AGM_Unconscious_RB ppEffectEnable False;
      if !(isNull (uiNamespace getVariable ["AGM_Core_dlgDisableMouse", displayNull])) then {
        [False] call AGM_Core_fnc_disableUserInput;
      };
      if (_blind) then {
        // blinding strength depedent on light level
        _strength = 0.78 * (call AGM_Core_fnc_ambientBrightness);
        AGM_Blinding_CC ppEffectEnable True;
        AGM_Blinding_CC ppEffectAdjust [1,1,_strength, [1,1,1,0], [0,0,0,1], [0,0,0,0]];
        AGM_Blinding_CC ppEffectCommit 0.01;
        waitUntil {ppEffectCommitted AGM_Blinding_CC};
        AGM_Blinding_CC ppEffectAdjust [1,1,0, [1,1,1,0], [0,0,0,1], [0,0,0,0]];
        AGM_Blinding_CC ppEffectCommit (_strength * 2);
        (_strength * 2) spawn {
          sleep _this;
          AGM_Blinding_CC ppEffectEnable False;
        };
        _blind = False;
      };
    };

    // Pain Effect
    _strength = AGM_player getVariable ["AGM_Pain", 0];
    _strength = _strength * (AGM_player getVariable ["AGM_Medical_CoefPain", AGM_Medical_CoefPain]);
    if (profileNamespace getVariable ["AGM_alternativePainEffect", False]) then {
      AGM_Pain_CA ppEffectEnable False;
      if ((AGM_player getVariable ["AGM_Pain", 0]) > 0 && {alive AGM_player}) then {
        AGM_Pain_CC ppEffectEnable True;
        AGM_Pain_CC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [(1 - _strength * 0.17) max 0,(1 - _strength * 0.17) max 0,0,0,0,0.2,2]];
        AGM_Pain_CC ppEffectCommit 1;
        sleep (1.5 - (AGM_player getVariable ["AGM_Pain", 0]));
        AGM_Pain_CC ppEffectAdjust [1,1,0, [1,1,1,1], [0,0,0,0], [1,1,1,1], [(1 - _strength * 1.7) max 0,(1 - _strength * 1.7) max 0,0,0,0,0.2,2]];
        AGM_Pain_CC ppEffectCommit 1;
        sleep 0.15;
      } else {
        AGM_Pain_CC ppEffectEnable False;
        sleep 1;
      };
    } else {
      AGM_Pain_CC ppEffectEnable False;
      if ((AGM_player getVariable ["AGM_Pain", 0]) > 0.05 && {alive AGM_player}) then {
        AGM_Pain_CA ppEffectEnable True;
        AGM_Pain_CA ppEffectAdjust [0.035 * _strength, 0.035 * _strength, False];
        AGM_Pain_CA ppEffectCommit 1;
        sleep (1.5 - (AGM_player getVariable ["AGM_Pain", 0]));
        AGM_Pain_CA ppEffectAdjust [0.35 * _strength, 0.35 * _strength, False];
        AGM_Pain_CA ppEffectCommit 1;
        sleep 0.15;
      } else {
        AGM_Pain_CA ppEffectEnable False;
        sleep 0.75;
      };
    };

    // Bleeding Effect
    if (damage AGM_player > 0.1 and _timeBlood + 6 < time) then {
      _timeBlood = time;
      [(damage AGM_player) * 500] call BIS_fnc_bloodEffect;
    };

    // Blood Level Effect
    _currentBlood = AGM_player getVariable ["AGM_Blood", 1];
    if (_currentBlood > 0.99) then {
      AGM_BloodLevel_CC ppEffectEnable False;
    } else {
      AGM_BloodLevel_CC ppEffectEnable True;
      AGM_BloodLevel_CC ppEffectAdjust [1, 1, 0, [0.0, 0.0, 0.0, 0.0], [1, 1, 1,_currentBlood],  [0.2, 0.2, 0.2, 0]];
      AGM_BloodLevel_CC ppEffectCommit 0;
    };

    _time = time;
    _damage = damage AGM_player;
  };
};
