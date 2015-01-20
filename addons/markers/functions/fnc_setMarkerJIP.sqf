// by commy2
#include "script_component.hpp"

private ["_allMapMarkers", "_allMapMarkersProperties", "_index", "_data", "_config"];

_allMapMarkers = _this select 0;
_allMapMarkersProperties = _this select 1;
_logic = _this select 2;

{
  _index = _allMapMarkers find _x;

  if (_index != -1) then {
    _data = _allMapMarkersProperties select _index;

    _config = (configfile >> "CfgMarkers") >> (_data select 0);
    if (!isClass _config) then {
      WARNING("CfgMarker not found, changed to milDot");
      _config == (configFile >> "CfgMarkers" >> "MilDot");
    };
    _x setMarkerTypeLocal (configName _config);

    _config = (configfile >> "CfgMarkerColors") >> (_data select 1);
    if (!isClass _config) then {
      WARNING("CfgMarkerColors not found, changed to Default");
      _config == (configFile >> "CfgMarkerColors" >> "Default");
    };
    _x setMarkerColorLocal (configName _config);

    _x setMarkerPosLocal (_data select 2);
    _x setMarkerDirLocal (_data select 3);
  };
} forEach allMapMarkers;

deleteVehicle _logic;
