/*
 * Author: Ruthberg
 * Shows/Hides the solution setup controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_solution_setup
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showSolutionSetup) = _this;

{ctrlShow [_x, _this]} forEach [15000, 15001, 15002, 15003, 15004, 15005, 15006, 15007, 15008, 15009, 15010, 15011, 15012];
