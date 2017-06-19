/*
 * Author: voiper
 * Check if an ammo classname is an IR chemlight.
 *
 * Arguments:
 * 0: Projectile or ammo classname <OBJECT> or <STRING>
 *
 * Return Value:
 * Is IR chemlight? <BOOL>
 *
 * Example:
 * ["Chemlight_blue"] call ace_chemlights_fnc_isIRClass;
 *
 * Public: No
 */

#include "script_component.hpp"

params [["_input", "", ["", objNull]]];

private _class = if (typeName _input == "OBJECT") then {typeOf _input} else {_input};

isText (configFile >> "CfgAmmo" >> _class >> "ACE_Chemlight_IR")
