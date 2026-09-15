#include "..\script_component.hpp"
/*
 * Author: tcvm
 * Called on unload of GPS UI
 *
 * Arguments:
 * Display <NUMBER>
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

