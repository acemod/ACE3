/*
 * Author: Commy2 and esteldunedain
 * Displays the weapon temperature
 *
 * Arguments:
 * 0: Player <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Values:
 * None
 *
 * Public: No
 */
#include "\z\ace\addons\overheating\script_component.hpp"

EXPLODE_2_PVT(_this,_player,_weapon);

// Calculate cool down of weapon since last shot
private ["_string", "_overheat", "_temperature", "_time", "_barrelMass", "_a"];
_string = format [QGVAR(%1), _weapon];
_overheat = _player getVariable [_string, [0, 0]];
_temperature = _overheat select 0;
_time = _overheat select 1;

// Get physical parameters
_barrelMass = 0.50 * (getNumber (configFile >> "CfgWeapons" >> _weapon >> "WeaponSlotsInfo" >> "mass") / 22.0) max 1.0;

// Calculate cooling
_temperature = [_temperature, _barrelMass, ACE_time - _time] call FUNC(cooldown);

// Store new temperature
_time = ACE_time;
_player setVariable [_string, [_temperature, _time], false];



private ["_scaledTemperature", "_action", "_color", "_count", "_string", "_text", "_picture"];
_scaledTemperature = (_temperature / 1000) min 1;

_color = [
  2 * _scaledTemperature min 1,
  2 * (1 - _scaledTemperature) min 1,
  00
];

_count = round (12 * _scaledTemperature);
_string = "";
for "_a" from 1 to _count do {
  _string = _string + "|";
};
_text = [_string, _color] call EFUNC(common,stringToColoredText);

_string = "";
for "_a" from (_count + 1) to 12 do {
  _string = _string + "|";
};

_text = composeText [
  _text,
  [_string, [0.5, 0.5, 0.5]] call EFUNC(common,stringToColoredText)
];

_picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");

[_text, _picture] call EFUNC(common,displayTextPicture);
