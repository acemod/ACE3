/*
 * Author: Garth 'L-H' de Wet
 * Determines whether passed goggles is diving goggles or a variant of them.
 *
 * Arguments:
 * 0: Glasses classname <STRING>
 *
 * Return Value:
 * Whether diving goggles are worn <BOOL>
 *
 * Example:
 * [(goggles ace_player)] call ace_goggles_fnc_isDivingGoggles;
 *
 * Public: Yes
 */
#include "script_component.hpp"
private ["_result"];
params ["_glasses"];
_result = _glasses == "G_Diving";
if (_result) exitWith {true};
_result = [configFile >> "CfgGlasses" >> _glasses, configFile >> "CfgGlasses" >> "G_Diving"] call CBA_fnc_inheritsFrom;
_result
