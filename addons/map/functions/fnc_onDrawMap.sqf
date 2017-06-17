/*
 * Author: commy2
 *
 *
 * Arguments:
 * Something
 *
 * Return Value:
 * None
 *
 * Example:
 * call ACE_map_fnc_onDrawMap
 *
 * Public: No
 */

#include "script_component.hpp"

((_this select 0) displayCtrl 1016) ctrlShow GVAR(mapShowCursorCoordinates);

// hide clock when no watch in inventory, or whatever never ever
((_this select 0) displayCtrl 101) ctrlShow GVAR(hasWatch);
