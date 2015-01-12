// by CAA-Picard
#include "\z\ace\addons\core\script_component.hpp"

// Read ACE_Parameters from config and set them on the mission namespace
_config = configFile >> "ACE_Parameters_Numeric";
_count = count _config;
for "_index" from 0 to (_count - 1) do {
  _x = _config select _index;

  _name = configName _x;
  _value = _x call bis_fnc_getcfgdata;
  [_name, _value] call FUNC(setParameter);
};

_config = configFile >> "ACE_Parameters_Boolean";
_count = count _config;
for "_index" from 0 to (_count - 1) do {
  _x = _config select _index;

  _name = configName _x;
  _value = _x call bis_fnc_getcfgdata;
  [_name, _value > 0] call FUNC(setParameter);
};


// Read ACE_Parameters from mission and set them on the mission namespace, replacing defaults if necesary
_config = missionConfigFile >> "ACE_Parameters";
_count = count _config;
for "_index" from 0 to (_count - 1) do {
  _x = _config select _index;

  _name = configName _x;
  _value = _x call bis_fnc_getcfgdata;
  [_name, _value] call FUNC(setParameter);
};

_config = missionConfigFile >> "ACE_Parameters_Numeric";
_count = count _config;
for "_index" from 0 to (_count - 1) do {
  _x = _config select _index;

  _name = configName _x;
  _value = _x call bis_fnc_getcfgdata;
  [_name, _value] call FUNC(setParameter);
};

_config = missionConfigFile >> "ACE_Parameters_Boolean";
_count = count _config;
for "_index" from 0 to (_count - 1) do {
  _x = _config select _index;

  _name = configName _x;
  _value = _x call bis_fnc_getcfgdata;
  [_name, _value > 0] call FUNC(setParameter);
};
