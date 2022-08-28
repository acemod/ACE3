#include "script_component.hpp"
/*
 * Author: veteran29
 * Replaces the vehicle clan logo with an empty texture.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Change in brightness (1 or -1) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, 1] call ace_nightvision_fnc_changeNVGBrightness
 *
 * Public: No
 */

params ["_vehicle"];

if !("clan" in selectionNames _vehicle) exitWith {
    TRACE_1("vehicle does not have 'clan' selection",_vehicle);
};

TRACE_1("replacing clan logo with empty texture",_vehicle);
_vehicle setObjectTextureGlobal ["clan", "#(argb,1,1,1)color(0,0,0,0)"];

nil
