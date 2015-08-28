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
_glasses isKindOf ["G_Diving", configFile >> "CfgGlasses"]
