/*
 * Author: voiper
 * Combine a chemlight shield item and a chemlight item into a light.
 *
 * Arguments:
 * 0: Target unit <OBJECT>
 * 1: Activator Unit (player) <OBJECT>
 * 2: Chemlight class, chemlight shield class <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * [_player, _player, ["Chemlight_Green", "ACE_Chemlight_Shield_Green"]] call ace_chemlights_fnc_assembleShield;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_unit", "_args"];
_args params ["_chemlight", "_shieldClass"];
private ["_cfg", "_displayName", "_picture", "_text"];

_cfg = (configFile >> "CfgWeapons" >> _shieldClass);
_displayName = getText (_cfg >> "displayName");
_picture = getText (_cfg >> "picture");
_text = format [localize LSTRING(Action_Prepare_Done), _displayName];

_unit removeItem _chemlight;
_unit removeItem "ACE_Chemlight_Shield";
_unit addItem _shieldClass;

[_text, _picture] call EFUNC(common,displayTextPicture);
[eyePos _unit] call FUNC(shakeSound);