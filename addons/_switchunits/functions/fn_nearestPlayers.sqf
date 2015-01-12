/*
  Name: AGM_SwitchUnits_fnc_nearestPlayers
  
  Author(s):
    bux578
  
  Description:
    Returns an array of alive players in a given radius around a given location
  
  Parameters:
    0: POSTION - Center position
    1: NUMBER - Radius
  
  Returns:
    ARRAY<OBJECT> - Player units
*/

private ["_position", "_radius", "_nearestPlayers"];

_position = _this select 0;
_radius = _this select 1;

_nearestPlayers = [];

{
  if ([_x] call AGM_Core_fnc_isPlayer && {alive _x}) then {
    _nearestPlayers pushBack _x;
  };
} forEach (nearestObjects [_position, ["Man"], _radius]);

 _nearestPlayers
