/*
 * Author: voiper
 * Disassemble a chemlight shield into an empty shield and a chemlight.
 *
 * Arguments:
 * 0: Target unit <OBJECT>
 * 1: Activator Unit (player) <OBJECT>
 * 2: Chemlight shield class, chemlight class <ARRAY>
 *
 * Return value:
 * None
 *
 * Example:
 * [_player, _player, ["ACE_Chemlight_Shield_Green", "chemlight_green"]] call ace_chemlights_fnc_disassembleShield;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_target", "_unit", "_args"];
_args params ["_shieldClass", "_chemlight"];
private ["_cfg", "_displayName", "_picture", "_text", "_emptyShield"];

_emptyShield = "ACE_Chemlight_Shield";

_cfg = (configFile >> "CfgWeapons" >> _shieldClass);
_chemlight = getText (_cfg >> "ACE_Chemlight");
_displayName = getText (_cfg >> "displayName");
_text = format [localize LSTRING(Action_Disassemble_Done), _displayName];

if !(_unit canAdd _chemlight) exitWith {
    [localize LSTRING(Inventory_Full)] call EFUNC(common,displayTextStructured);
};

_unit removeItem _shieldClass;
_unit addItemToUniform _chemlight;
_unit addItemToUniform _emptyShield;

[_text] call EFUNC(common,displayTextStructured);