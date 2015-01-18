// by commy2

if (_this select 1 == 1) then {
  disableserialization;
  _display = _this select 0;

  _pos = ctrlPosition (_display displayCtrl 102);
  _pos = [
    (_pos select 0) + (_pos select 2) / 2,
    (_pos select 1) + (_pos select 3) / 2
  ];

  switch (true) do {
    case (!isNull findDisplay 12) : {
      _pos = (findDisplay 12 displayCtrl 51) ctrlMapScreenToWorld _pos;
    };
    case (!isNull findDisplay 37) : {
      _pos = (findDisplay 37 displayCtrl 51) ctrlMapScreenToWorld _pos;
    };
    case (!isNull findDisplay 52) : {
      _pos = (findDisplay 52 displayCtrl 51) ctrlMapScreenToWorld _pos;
    };
    case (!isNull findDisplay 53) : {
      _pos = (findDisplay 53 displayCtrl 51) ctrlMapScreenToWorld _pos;
    };
  };

  _pos spawn {
    /*[
      allMapMarkers select (count allMapMarkers - 1),
      [
        uiNamespace getVariable ['AGM_Markers_currentMarkerShape', 0],
        uiNamespace getVariable ['AGM_Markers_currentMarkerColor', 0],
        _this,
        uiNamespace getVariable ['AGM_Markers_currentMarkerAngle', 0]
      ]
    ] call AGM_Markers_fnc_setMarker;*/

    [
      [
        allMapMarkers select (count allMapMarkers - 1),
        [
          uiNamespace getVariable ['AGM_Markers_currentMarkerShape', 0],
          uiNamespace getVariable ['AGM_Markers_currentMarkerColor', 0],
          _this,
          uiNamespace getVariable ['AGM_Markers_currentMarkerAngle', 0]
        ]
      ], "AGM_Markers_fnc_setMarkerNetwork", 2
    ] call AGM_Core_fnc_execRemoteFnc;
  };
};
