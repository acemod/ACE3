#include "script_component.hpp"
/*
 * Author: PabstMirror
 * Dummy function to include BIS script file.
 * Used in initalisation of zeus attribute displays.
 *
 * Arguments:
 * 0: UI event string <STRING>
 * 1: UI event parameters <ARRAY>
 * 2: Display class name <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * onLoad = "['onLoad',_this,'RscDisplayExample'] call ace_zeus_fnc_zeusAttributes"
 *
 * Public: No
 */

TRACE_1("params",_this);

#include "\a3\ui_f_curator\UI\Displays\RscDisplayAttributes.sqf"
