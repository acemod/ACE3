/*
 * Author: Nelson Duarte
 * Function used to handle child destroyed
 * This only matters when abort button is pressed in child escape menu
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_display","_child","_exitCode"];

if (_exitCode == 104) then {
    _display closeDisplay 2;
    MAIN_DISPLAY closeDisplay 2;
};
