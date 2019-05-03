#include "script_component.hpp"
/*
 * Author: commy2
 * Check if avatar is using the optics mode.
 *
 * Arguments:
 * 0: Optics mode helper control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [true] call ace_nightvision_fnc_isUsingOptic
 *
 * Public: No
 */

(missionNamespace getVariable [QGVAR(OpticsModeControls), []]) findIf {ctrlShown _x} != -1
