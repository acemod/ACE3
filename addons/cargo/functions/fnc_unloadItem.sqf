#include "script_component.hpp"

//hint format ["%1", _this];

_vehicle = _this select 0;
_unit = _this select 1;
_item = _this select 2 select 0;

_size = getNumber(configFile >> "CfgVehicles" >> typeOf(_item) >> "ACE_Size");

[5 * _size, [_vehicle, _unit, _item], {_this call FUNC(unloadItemCallback)}, {}, localize "STR_ACE_Cargo_LoadingItem"] call EFUNC(common,progressBar);