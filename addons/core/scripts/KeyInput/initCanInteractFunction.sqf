// by commy2

private ["_function", "_configFile", "_count", "_index", "_config", "_configName", "_condition"];

_function = "private '_exceptions'; _exceptions = _this; alive AGM_player";

_configFile = configFile >> "GVAR(canInteractConditions)";
_count = count _configFile;

for "_index" from 0 to (_count -1) do {
  _config = _configFile select _index;
  _configName = configName _config;

  _condition = getText (_config >> "condition");

  _function = _function + format ["&& {%1 || {'%2' in _exceptions}}", _condition, _configName];
};

GVAR(canInteract) = compileFinal _function;
