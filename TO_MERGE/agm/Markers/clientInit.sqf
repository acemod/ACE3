// by commy2

// request marker data for JIP
if (isMultiplayer && {!isServer}) then {
  _logic = createGroup sideLogic createUnit ["Logic", [0,0,0], [], 0, "NONE"];
  [_logic, "AGM_Markers_fnc_sendMarkersJIP", 1] call AGM_Core_fnc_execRemoteFnc;
};
