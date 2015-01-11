// by commy2 and CAA-Picard
#define STRENGHTODEAFNESS 3
#define MAXDEAFNESS 1.1

AGM_CurrentDeafness = 0;
AGM_NewStrength = 0;

// Spawn volume updating process
0 spawn {
  while {true} do {
    _player = AGM_player;

    // Check if new noises increase deafness
    if (AGM_NewStrength * STRENGHTODEAFNESS > AGM_CurrentDeafness) then {
      AGM_CurrentDeafness = AGM_NewStrength * STRENGHTODEAFNESS min MAXDEAFNESS;

      // icon is CUT
      /*if (AGM_CurrentDeafness > 0.4) then {
        if (AGM_CurrentDeafness > 0.8) then {
          [parseText "<img align='center' size='2.5' color='#FF0000' image='AGM_Hearing\UI\deafness_x_ca.paa'/>"] call AGM_Core_fnc_displayTextStructured;
        } else {
          [parseText "<img align='center' size='2.5' color='#FFFF00' image='AGM_Hearing\UI\deafness_x_ca.paa'/>"] call AGM_Core_fnc_displayTextStructured;
        };
      };*/
    };
    AGM_NewStrength = 0;

    // Recover rate is slower if deafness is severe
    _recoverRate = 0.01;
    if (AGM_CurrentDeafness > 0.7) then {
      _recoverRate = 0.005;
      if (AGM_CurrentDeafness > 0.9) then {
        _recoverRate = 0.002;
      };
    };

    // Deafness recovers with time
    AGM_CurrentDeafness = AGM_CurrentDeafness - _recoverRate max 0;

    // needed until Bohemia fixes playSound to actually use the second argument
    _volume = (1 - AGM_CurrentDeafness max 0)^2 max 0.1;

    // Earplugs reduce hearing 20%
    if ([_player] call AGM_Hearing_fnc_hasEarPlugsIn) then {
      _volume = _volume min 0.8;
    };

    // Reduce volume if player is unconscious
    if (_player getVariable ["AGM_isUnconscious", false]) then {
      _volume = _volume min 0.4;
    };

    if (!(missionNameSpace getVariable ["AGM_Hearing_disableVolumeUpdate", false])) then {
      0.1 fadeSound _volume;
      0.1 fadeSpeech _volume;
      _player setVariable ["tf_globalVolume", _volume];
      _player setVariable ["acre_sys_core_globalVolume", _volume];
    };

    //hintSilent format ["AGM_CurrentDeafness, _Volume = %1, %2", AGM_CurrentDeafness, _volume];

    sleep 0.1;
  };
};
