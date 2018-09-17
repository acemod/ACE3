#include "script_component.hpp"
/*
 * Author: commy2
 * Determines whether passed goggles is diving goggles or a variant of them.
 *
 * Arguments:
 * 0: Glasses classname <STRING>
 *
 * Return Value:
 * Check if these goggles are diving goggles <BOOL>
 *
 * Example:
 * [goggles ace_player] call ace_goggles_fnc_isDivingGoggles;
 *
 * Public: Yes
 */

params ["_glasses"];

private _config = configFile >> "CfgGlasses" >> _glasses;

if (!isClass _config) exitWith {false};

getNumber (_config >> "mode") == 1 // return
