/*
 * Author: Alganthe
 * Toggle the stats control group
 *
 * Arguments:
 * 0: Arsenal display <DISPLAY>
 * 1: Button control <CONTROL>
 *
 * Return Value:
 * None
 *
 * Public: No
*/
#include "script_component.hpp"
#include "..\defines.hpp"

params ["_display"];

(_display displayCtrl IDC_statsButton) ctrlShow GVAR(showStats);
GVAR(showStats) = !GVAR(showStats);

{
    (_display displayCtrl _x) ctrlShow GVAR(showStats);
} foreach [
    IDC_statsBox,
    IDC_statsPreviousPage,
    IDC_statsNextPage,
    IDC_statsCurrentPage,
    IDC_statsButtonClose
];

