/*
 * Author: esteldunedain
 * Display a grenade type and quantity.
 *
 * Arguments:
 * 0: magazine class <STRING>
 * 1: number of magazines <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [currentMagazine player, 3] call ace_weaponselect_fnc_displayGrenadeTypeAndNumber
 *
 * Public: No
 */
#include "script_component.hpp"

if !(GVAR(DisplayText)) exitwith {};

private ["_color", "_name", "_text", "_picture"];

params ["_magazine", "_numberofMagazines"];

_color = [[1, 0, 0], [1, 1, 1]] select (_numberofMagazines > 0);
_name = getText (configFile >> "CfgMagazines" >> _magazine >> "displayNameShort");

_text = [format["%1  x%2", _name, _numberofMagazines], _color] call EFUNC(common,stringToColoredText);
_picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");

[_text, _picture] call EFUNC(common,displayTextPicture);
