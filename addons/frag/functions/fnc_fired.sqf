#include "script_component.hpp"
private["_gun", "_type", "_round"];

_gun = _this select 0;
_type = _this select 4;
_round = _this select 6;

[_gun, _type, _round] call FUNC(addPfhRound);
