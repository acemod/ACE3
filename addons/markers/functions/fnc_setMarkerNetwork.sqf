// by commy2
#include "script_component.hpp"

private ["_marker", "_data", "_config"];

_marker = _this select 0;
_data = _this select 1;

_config = (configfile >> "CfgMarkers") >> (_data select 0);
if (!isClass _config) then {
  WARNING("CfgMarker not found, changed to milDot");
  _config == (configFile >> "CfgMarkers" >> "MilDot");
};
_marker setMarkerTypeLocal (configName _config);

_config = (configfile >> "CfgMarkerColors") >> (_data select 1);
if (!isClass _config) then {
  WARNING("CfgMarkerColors not found, changed to Default");
  _config == (configFile >> "CfgMarkerColors" >> "Default");
};
_marker setMarkerColorLocal configName _config;

_marker setMarkerPosLocal (_data select 2);
_marker setMarkerDirLocal (_data select 3);

// save properties on server machine for JIP, marker editing ready
if (isMultiplayer && {isServer}) then {
  private ["_allMapMarkers", "_allMapMarkersProperties", "_index"];

  _allMapMarkers = GETMVAR(allMapMarkers,[]);
  _allMapMarkersProperties = GETMVAR(allMapMarkersProperties,[]);

  _index = _allMapMarkers find _marker;

  if (_index == -1) then {
    _allMapMarkers pushBack _marker;
    _allMapMarkersProperties pushBack _data;
  } else {
    _allMapMarkers set [_index, _marker];
    _allMapMarkersProperties set [_index, _data];
  };

  GVAR(allMapMarkers) = _allMapMarkers;
  GVAR(allMapMarkersProperties) = _allMapMarkersProperties;
};
