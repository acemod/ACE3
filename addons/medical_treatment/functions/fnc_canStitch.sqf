#include "script_component.hpp"
/*
 * Author: Katalam
 * Prevents stitch actions from showing if the body is either fully sitched or has no open wounds.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * ReturnValue:
 * Can Stitch <BOOL>
 *
 * Public: No
 */

params ["", "_patient"];

if ((count (_patient getVariable [QEGVAR(medical,bandagedWounds), []])) > 0) exitWith {true};
false;
