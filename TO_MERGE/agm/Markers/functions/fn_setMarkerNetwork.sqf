// by commy2

private ["_marker", "_data", "_config"];

_marker = _this select 0;
_data = _this select 1;

_config = (configfile >> "CfgMarkers") select (_data select 0);
_marker setMarkerTypeLocal configName _config;

_config = (configfile >> "CfgMarkerColors") select (_data select 1);
_marker setMarkerColorLocal configName _config;

_marker setMarkerPosLocal (_data select 2);
_marker setMarkerDirLocal (_data select 3);

// save properties on server machine for JIP, marker editing ready
if (isMultiplayer && {isServer}) then {
  private ["_allMapMarkers", "_allMapMarkersProperties", "_index"];

  _allMapMarkers = missionNamespace getVariable ["AGM_allMapMarkers", []];
  _allMapMarkersProperties = missionNamespace getVariable ["AGM_allMapMarkersProperties", []];

  _index = _allMapMarkers find _marker;

  if (_index == -1) then {
    _allMapMarkers pushBack _marker;
    _allMapMarkersProperties pushBack _data;
  } else {
    _allMapMarkers set [_index, _marker];
    _allMapMarkersProperties set [_index, _data];
  };

  AGM_allMapMarkers = _allMapMarkers;
  AGM_allMapMarkersProperties = _allMapMarkersProperties;
};
