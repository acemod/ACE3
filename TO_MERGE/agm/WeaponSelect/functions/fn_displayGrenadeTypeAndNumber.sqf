/*
 * Author: CAA-Picard
 *
 * Display a grenade type and quantity.
 *
 * Argument:
 * 0: magazine class
 * 1: number of magazines
 *
 * Return value:
 * None
 */

_magazine = _this select 0;
_numberofMagazines = _this select 1;

_color = [];
if (_numberOfMagazines > 0) then {
  _color = [1,1,1];
} else {
  _color = [1,0,0];
};

_name = getText (configFile >> "CfgMagazines" >> _magazine >> "displayNameShort");
_picture = getText (configFile >> "CfgMagazines" >> _magazine >> "picture");
_text = [format["%1  x%2", _name, _numberOfMagazines], _color] call AGM_Core_fnc_stringToColoredText;
[_text, _picture] call AGM_Core_fnc_displayTextPicture;
