#include "script_component.hpp"
private["_p1","_p2","_return"];

_p1 = _this select 0;
_p2 = _this select 1;

if ((count _p1) != (count _p2)) then {textLogFormat ["BIS_FNC Error: vectors not of same size"]};

_return = [];

{
  _return set[_forEachIndex, (_p2 select _forEachIndex) - _x];
} forEach _p1;

_return
