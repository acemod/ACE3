//by commy2

while {true} do {
  waitUntil {!isNull (findDisplay 602)};
  waitUntil {
    _player = AGM_player;
    findDisplay 602 displayCtrl 111 ctrlSetText format ["%1 - %2 %3", [_player] call AGM_Core_fnc_getName, localize "STR_AGM_Movement_Weight", [_player] call AGM_Movement_fnc_getWeight];
    isNull (findDisplay 602)
  };
};
