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
 * Example:
 * [player, currentWeapon player] call ace_overheating_fnc_displayTemperature
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_weapon"];
TRACE_2("params",_player,_weapon);

// Calculate cool down of weapon since last shot
private _temperature = [_player, _weapon, 0] call FUNC(updateTemperature);
private _scaledTemperature = (_temperature / 1000) min 1;

private _color = [
    2 * (_scaledTemperature * 2 min 1) min 1,
    2 * (1 - (_scaledTemperature * 2 min 1)) min 1,
    00
];

private _count = round (12 * _scaledTemperature);
private _string = "";
for "_a" from 1 to _count do {
    _string = _string + "|";
};
private _text = [_string, _color] call EFUNC(common,stringToColoredText);

_string = "";
for "_a" from (_count + 1) to 12 do {
    _string = _string + "|";
};

_text = composeText [_text, [_string, [0.5, 0.5, 0.5]] call EFUNC(common,stringToColoredText)];

private _picture = getText (configFile >> "CfgWeapons" >> _weapon >> "picture");

[_text, _picture] call EFUNC(common,displayTextPicture);
