#include "script_component.hpp"
/*
 * Author: Nelson Duarte
 * Function used to handle child destroyed event
 * This only matters when abort button is pressed in child escape menu
 * Will close main display to exit client from mission
 *
 * Arguments:
 * 0: Spectator display <DISPLAY>
 * 1: Child display <DISPLAY>
 * 2: Exit code of child <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * _this call ace_spectator_fnc_ui_handleChildDestroyed
 *
 * Public: No
 */

params ["_display","_child","_exitCode"];

if (_exitCode == 104) then {
    _display closeDisplay 2;
    MAIN_DISPLAY closeDisplay 2;
};
