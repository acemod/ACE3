// by commy2

private ["_rallypoint", "_name"];

_rallypoint = _this select 0;

if (!local _rallypoint) exitWith {};

_name = typeOf _rallypoint;

if (isNil _name) then {
  missionNamespace setVariable [_name, _rallypoint];
  publicVariable _name;
} else {
  deleteVehicle _rallypoint;
  diag_log text "[AGM] Respawn: ERROR Multiple Rallypoints of same type.";
};
