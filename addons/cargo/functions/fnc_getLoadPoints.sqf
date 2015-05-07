#include "script_component.hpp"

private ["_result", "_config", "_count", "_class"];
_result = [];

_config = configFile >> "CfgVehicles" >> typeOf(_this) >> "ACE_Load";
_count = count _config;

for "_index" from 0 to (_count - 1) do {
	_class = _config select _index;
	if (isClass (_class)) then {
		_result pushBack [getText (_class >> "memoryPoint"), getNumber (_class >> "loadSize"), GetArray(_class >> "loadPosition"), _this getVariable [format["ACE_Load_%1", configName _class], []], configName _class];
	};
};

_result