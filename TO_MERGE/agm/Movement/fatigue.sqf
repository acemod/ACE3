// by commy2

#define THRESHOLD_1 0.8
#define THRESHOLD_2 0.9
#define THRESHOLD_3 0.99

// init onEachFrame EH
AGM_UpdatePlayerFatigue_EHID = ["AGM_UpdatePlayerFatigue", "onEachFrame", {
  _player = AGM_player;

  // calc new fatigue
  _fatigue = getFatigue _player;
  _fatigueOld = _player getVariable ["AGM_Fatigue", getFatigue _player];

  if (_fatigue > _fatigueOld) then {
    _fatigue = _fatigueOld + (missionNamespace getVariable ["AGM_Fatigue_CoefFatigue", 1]) * (_fatigue - _fatigueOld) max 0 min 1;
  } else {
    _fatigue = _fatigueOld - (missionNamespace getVariable ["AGM_Fatigue_CoefRecover", 1]) * (_fatigueOld - _fatigue) max 0 min 1;
  };

  _player setFatigue _fatigue;
  _player setVariable ["AGM_Fatigue", _fatigue];

  ["Fatigue", _player, {getFatigue _this}] call AGM_Debug_fnc_log;
}] call BIS_fnc_addStackedEventHandler;

// init script ehids
_handleRecoil = scriptNull;
_handleBlinking = scriptNull;
_handleHeartbeat = scriptNull;
_handleStumble = scriptNull;

// apply fatigue effects
while {true} do {
  _fatigue = getFatigue AGM_player;

  if (_fatigue > THRESHOLD_1) then {
    if (scriptDone _handleHeartbeat) then {
      _handleHeartbeat = call AGM_Movement_fnc_heartbeat;
    };
    if (_fatigue > THRESHOLD_2) then {
      if (scriptDone _handleBlinking) then {
        _handleBlinking = call AGM_Movement_fnc_blinking;
      };

      if (_fatigue > THRESHOLD_3) then {
        if (scriptDone _handleStumble) then {
          _handleStumble = call AGM_Movement_fnc_stumble;
        };
      };
    };
  };

  sleep 0.5;
};
