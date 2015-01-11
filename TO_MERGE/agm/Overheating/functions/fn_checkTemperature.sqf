// by commy2 and CAA-Picard

_this spawn {
  _player = _this select 0;
  _weapon = _this select 1;

  // Calculate cool down of weapon since last shot
  _string = format ["AGM_Overheating_%1", _weapon];
  _overheat = _player getVariable [_string, [0, 0]];
  _temperature = _overheat select 0;
  _time = _overheat select 1;

  // Get physical parameters
  _barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

  // Calculate cooling
  _temperature = [_temperature, _barrelMass, time - _time] call AGM_Overheating_fnc_cooldown;

  ["Overheating", _temperature, {format ["Temperature: %1 °C", _this]}] call AGM_Debug_fnc_log;

  // Store new temperature
  _time = time;
  _player setVariable [_string, [_temperature, _time], false];
  _scaledTemperature = (_temperature / 1000) min 1;

  // Play animation and report temperature
  _action = getText (configFile >> "CfgWeapons" >> _weapon >> "AGM_checkTemperatureAction");

  if (_action == "") then {
    _action = "Gear";
  };

  _player playActionNow _action;

  sleep 1;

  _color = [
    2 * _scaledTemperature min 1,
    2 * (1 - _scaledTemperature) min 1,
    00
  ];

  _count = 2 + round (10 * _scaledTemperature);
  _string = "";
  for "_a" from 1 to _count do {
    _string = _string + "|";
  };
  _text = [_string, _color] call AGM_Core_fnc_stringToColoredText;

  _string = "";
  for "_a" from (_count + 1) to 12 do {
    _string = _string + "|";
  };

  _text = composeText [
    _text,
    [_string, [0.5, 0.5, 0.5]] call AGM_Core_fnc_stringToColoredText
  ];

  _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");

  [_text, _picture] call AGM_Core_fnc_displayTextPicture;
};
