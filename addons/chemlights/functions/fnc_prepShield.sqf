#include "script_component.hpp"
/*
 * Author: voiper
 * Combine a chemlight shield item and a chemlight item into a light.
 *
 * Arguments:
 * 0: Target unit <OBJECT>
 * 1: Activator Unit (player) <OBJECT>
 * 2: Chemlight class, chemlight shield class <ARRAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _player, ["Chemlight_Green", "ACE_Chemlight_Shield_Green"]] call ace_chemlights_fnc_prepShield;
 *
 * Public: No
 */

params ["_target", "_unit", "_args"];
_args params ["_chemlight", "_shieldClass"];

private _cfg = (configFile >> "CfgWeapons" >> _shieldClass);
private _displayName = getText (_cfg >> "displayName");
private _picture = getText (_cfg >> "picture");
private _text = format [localize LSTRING(Action_Prepare_Done), _displayName];

//we don't need to check for space, because it's always 2g -> 1g
_unit removeItem _chemlight;
_unit removeItem "ACE_Chemlight_Shield";
_unit addItem _shieldClass;

[_text, _picture] call EFUNC(common,displayTextPicture);
playSound3D ["A3\sounds_f\weapons\Other\dry4.wss", objNull, false, eyePos _unit, 2, 2, 10];
