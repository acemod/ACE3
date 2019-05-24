#include "script_component.hpp"
/*
 * Author: Katalam
 * Prevents stitch actions from showing if the body is either fully stitched or has no open wounds.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * ReturnValue:
 * Can Stitch <BOOL>
 *
 * Example:
 * [player, cursorTarget] call ace_medical_treatment_fnc_canStitch
 *
 * Public: No
 */

params ["", "_patient"];

!((_patient getVariable [QEGVAR(medical,bandagedWounds), []]) isEqualTo [])
