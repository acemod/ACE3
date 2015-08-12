// by commy2

#include "script_component.hpp"

private ["_vehicle", "_item"];

_vehicle = _this select 0;

_item = ['ACE_SpareTrack', [-1000, -1000, 100]] call FUNC(spawnObject);
[_vehicle, _item] call FUNC(initLoadedObject);

_item = ['ACE_SpareTrack', [-1000, -1000, 100]] call FUNC(spawnObject);
[_vehicle, _item] call FUNC(initLoadedObject);
