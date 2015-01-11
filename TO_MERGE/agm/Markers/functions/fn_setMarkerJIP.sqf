// by commy2

private ["_allMapMarkers", "_allMapMarkersProperties", "_index", "_data", "_config"];

_allMapMarkers = _this select 0;
_allMapMarkersProperties = _this select 1;
_logic = _this select 2;

{
  _index = _allMapMarkers find _x;

  if (_index != -1) then {
    _data = _allMapMarkersProperties select _index;

    _config = (configfile >> "CfgMarkers") select (_data select 0);
    _x setMarkerTypeLocal configName _config;

    _config = (configfile >> "CfgMarkerColors") select (_data select 1);
    _x setMarkerColorLocal configName _config;

    _x setMarkerPosLocal (_data select 2);
    _x setMarkerDirLocal (_data select 3);
  };
} forEach allMapMarkers;

deleteVehicle _logic;
