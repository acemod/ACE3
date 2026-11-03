#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Called on unload of GPS UI
 *
 * Arguments:
 * 0: Display (not used) <DISPLAY>
 * 1: Exit code (not used) <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_missileguidance_fnc_gps_onUnload
 *
 * Public: No
 */
[GVAR(gps_uiPerFrameHandler)] call CBA_fnc_removePerFrameHandler;

