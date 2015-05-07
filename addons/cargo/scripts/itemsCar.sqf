// by commy2

#include "script_component.hpp"

private ["_vehicle", "_item"];

_vehicle = _this select 0;

_item = ['ACE_JerryCan', [-1000, -1000, 100]] call FUNC(spawnObject);
[_vehicle, _item] call FUNC(initLoadedObject);

// Do not add spare wheels to light vehicles like quad bikes and karts.
if (getMass _vehicle >= 1000) then {
  _item = ['ACE_SpareWheel', [-1000, -1000, 100]] call FUNC(spawnObject);
  [_vehicle, _item] call FUNC(initLoadedObject);
};