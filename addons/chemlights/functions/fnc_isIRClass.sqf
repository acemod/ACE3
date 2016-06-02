/*
 * Author: voiper
 * Check if an ammo classname is an IR chemlight.
 *
 * Arguments:
 * 1: Projectile or ammo classname <OBJECT> or <STRING>
 *
 * Return Value:
 * 1: True or false <BOOL>
 *
 * Example:
 * ["Chemlight_blue"] call ace_chemlights_fnc_isIRClass;
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_input"];

if !(typeName _input in ["OBJECT", "STRING"]) exitWith {
    ERROR("Wrong input type");
};

private _class = if (typeName _input == "OBJECT") then {typeOf _input} else {_input};

((getText (configFile >> "CfgAmmo" >> _class >> "ACE_Chemlight_IR")) != "")