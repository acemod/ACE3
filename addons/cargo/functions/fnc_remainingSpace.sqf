#include "script_component.hpp"

private  ["_size", "_objects", "_usedSize", "_objSize"];
_size = _this select 0;
_objects = _this select 1;
_usedSize = 0;

hint format ["%1 : %2 : %3", _size, _objects, _usedSize];
{
	_objSize = 1;
	if (isNumber (ConfigFile >> "CfgVehicles" >> typeOf(_x) >> "ACE_Size")) then {
		_objSize = getNumber(ConfigFile >> "CfgVehicles" >> typeOf(_x) >> "ACE_Size");
	};
	_usedSize = _usedSize + _objSize;
} count _objects;

(_size - _usedSize)