#include "..\script_component.hpp"
/*
 * Author: commy2
 * Updates map display elements on draw: shows/hides the cursor coordinates and the clock.
 *
 * Arguments:
 * 0: Map display <DISPLAY>
 *
 * Return Value:
 * None
 *
 * Example:
 * [findDisplay 12] call ace_map_fnc_onDrawMap
 *
 * Public: No
 */

((_this select 0) displayCtrl 1016) ctrlShow GVAR(mapShowCursorCoordinates);

// hide clock when no watch in inventory, or whatever never ever
((_this select 0) displayCtrl 101) ctrlShow GVAR(hasWatch);
