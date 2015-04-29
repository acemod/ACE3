#include "script_component.hpp"

private ["_obj","_title","_size","_additional"];
_obj = _this select 3;
_title = _this select 4;
_size = _this select 2;
_additional = _this select 5;

_obj = [_obj] call FUNC(objToRank);
_size = [_size] call FUNC(size_indexToString);

[_title,_size,_obj,_additional]