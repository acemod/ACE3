// by commy2

private "_logic";

_logic = _this;

[
  [
    missionNamespace getVariable ["AGM_allMapMarkers", []],
    missionNamespace getVariable ["AGM_allMapMarkersProperties", []],
    _logic
  ],
  "AGM_Markers_fnc_setMarkerJIP",
  _logic
] call AGM_Core_fnc_execRemoteFnc;
