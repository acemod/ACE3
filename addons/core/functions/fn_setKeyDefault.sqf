/*
 * Author: commy2
 *
 * Set all keys from the 'GVAR(Default_Keys)' base class that are missing in the current user profile.
 *
 * Argument:
 * 1: Overwrite existing key binds? (Bool)
 *
 * Return value:
 * None.
 */

private ["_overwrite", "_saveProfile", "_config", "_count", "_index", "_configFile", "_name", "_key", "_shft", "_ctrl", "_alt", "_keyCode", "_state"];

_overwrite = _this select 0;

_saveProfile = false;

_config = configFile >> "GVAR(Default_Keys)";
_count = count _config;

for "_index" from 0 to (_count - 1) do {
  _configFile = _config select _index;
  _name = format ["AGM_Key_%1", configName _configFile];
  _key = profileNamespace getVariable _name;

  if (isNil "_key" || {_overwrite}) then {
    _key = getNumber (_configFile >> "Key");
    _shft = getNumber (_configFile >> "Shift") == 1;
    _ctrl = getNumber (_configFile >> "Control") == 1;
    _alt = getNumber (_configFile >> "Alt") == 1;

    _keyCode = [_key, _shft, _ctrl, _alt] call GVAR(fnc_convertKeyCode);

    profileNamespace setVariable [_name, _keyCode];
    _saveProfile = true;
  };
};

_config = configFile >> "GVAR(Options)";
_count = count _config;

for "_index" from 0 to (_count - 1) do {
  _configFile = _config select _index;
  _name = format ["AGM_%1", configName _configFile];
  _state = profileNamespace getVariable _name;

  if (isNil "_state" || {_overwrite}) then {
    _state = getNumber (_configFile >> "default") == 1;

    profileNamespace setVariable [_name, _state];
    _saveProfile = true;
  };
};

if (_overwrite) then {
    saveProfileNamespace;
    diag_log text "[AGM]: Profile settings overwritten.";
} else {
  if (_saveProfile) then {
    saveProfileNamespace;
    diag_log text "[AGM]: Encountered missing variable in profile namespace. Profile saved.";
  } else {
    diag_log text "[AGM]: No missing variables encountered in profile namespace.";
  };
};
