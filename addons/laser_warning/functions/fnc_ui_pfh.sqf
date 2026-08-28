#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Refreshes LWS screen
 *
 * Arguments:
 * 0: Display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [ace_laser_warning_fnc_ui_pfh, 0, [displayNull]] call CBA_fnc_addPerFrameHandler
 *
 * Public: No
 */
params ["_args", "_pfhId"];
_args params ["_display"];
private _screen = _display displayCtrl 300;

