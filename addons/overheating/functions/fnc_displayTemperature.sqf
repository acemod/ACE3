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

private ["_temperature", "_scaledTemperature", "_color", "_count", "_string", "_text", "_picture"];

// Calculate cool down of weapon since last shot
_temperature = [_player, _weapon, 0] call FUNC(updateTemperature);
_scaledTemperature = (_temperature / 1000) min 1;

_color = [
    2 * (_scaledTemperature * 2 min 1) min 1,
    2 * (1 - (_scaledTemperature * 2 min 1)) min 1,
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
