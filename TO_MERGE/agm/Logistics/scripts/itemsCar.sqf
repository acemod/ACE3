// by commy2

private ["_vehicle", "_item"];

_vehicle = _this select 0;

_item = ['AGM_JerryCan', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
[_vehicle, _item] call AGM_Logistics_fnc_initLoadedObject;

// Do not add spare wheels to light vehicles like quad bikes and karts.
if (getMass _vehicle >= 1000) then {
  _item = ['AGM_SpareWheel', [-1000, -1000, 100]] call AGM_Logistics_fnc_spawnObject;
  [_vehicle, _item] call AGM_Logistics_fnc_initLoadedObject;
};
