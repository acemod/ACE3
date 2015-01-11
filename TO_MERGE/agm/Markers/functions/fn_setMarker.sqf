// by commy2

private ["_marker", "_data", "_config"];

_marker = _this select 0;
_data = _this select 1;

_config = (configfile >> "CfgMarkers") select (_data select 0);
[[_marker, configName _config], "{if ((_this select 0) in allMapMarkers) then {(_this select 0) setMarkerTypeLocal (_this select 1)};}", 2] call AGM_Core_fnc_execRemoteFnc;

_config = (configfile >> "CfgMarkerColors") select (_data select 1);
[[_marker, configName _config], "{if ((_this select 0) in allMapMarkers) then {(_this select 0) setMarkerColorLocal (_this select 1)};}", 2] call AGM_Core_fnc_execRemoteFnc;

[[_marker, _data select 2], "{if ((_this select 0) in allMapMarkers) then {(_this select 0) setMarkerPosLocal (_this select 1)};}", 2] call AGM_Core_fnc_execRemoteFnc;
[[_marker, _data select 3], "{if ((_this select 0) in allMapMarkers) then {(_this select 0) setMarkerDirLocal (_this select 1)};}", 2] call AGM_Core_fnc_execRemoteFnc;
