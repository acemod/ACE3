#include "script_component.hpp"
/*
 * Author: esteldunedain, commy2
 * Display a grenade type and quantity.
 *
 * Arguments:
 * 0: grenade magazine class <STRING>
 * 1: number of grenades <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [currentMagazine player, 3] call ace_weaponselect_fnc_displayGrenadeTypeAndNumber
 *
 * Public: No
 */

if !(GVAR(DisplayText)) exitWith {};

params ["_magazine", "_numberofGrenades"];

private _color = [[1, 0, 0], [1, 1, 1]] select (_numberofGrenades > 0);
private _name = getText (configFile >> "CfgMagazines" >> _magazine >> "displayNameShort");

private _text = [format ["%1  x%2", _name, _numberofGrenades], _color] call EFUNC(common,stringToColoredText);
private _picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");

[_text, _picture] call EFUNC(common,displayTextPicture);
