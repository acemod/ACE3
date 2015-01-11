// by commy2

terminate (missionNamespace getVariable ["AGM_Debug_MonitorFnc", scriptNull]);

AGM_Debug_MonitorFnc = _this spawn {
  waitUntil {
    hintSilent str (call _this);
    false
  };
};
