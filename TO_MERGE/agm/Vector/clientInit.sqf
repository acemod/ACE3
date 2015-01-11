// by commy2

player setVariable ["AGM_cooldownVector", 0, false];

AGM_isVectorReady = true;
AGM_vectorKey = [false, false];
AGM_vectorConfig = [0, 0];
AGM_vectorSettings = [false, false, false, false];

0 spawn {
  waitUntil {preloadTitleRsc ["AGM_Digit_Preload", "PLAIN"]};
  waitUntil {preloadTitleRsc ["AGM_Debug_Crosshair", "PLAIN"]};
};
