/*
 * Author: commy2
 * Remove a map marker creation event handler.
 *
 * Arguments:
 * 0: ID of the event handler <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * [5] call ace_common_fnc_removeMapMarkerCreatedEventHandler
 *
 * Public: Yes
 */
#include "script_component.hpp"

ACE_DEPRECATED(QFUNC(removeMapMarkerCreatedEventHandler),"3.14.0","CBA_fnc_removeMarkerEventHandler");

["created", param [0, -1]] call CBA_fnc_removeMarkerEventHandler;
