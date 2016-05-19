/*
 * Author: Nou
 * Remove all events of a certain event type.
 *
 * Argument:
 * 0: Event name <STRING>
 *
 * Return Value:
 * None
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_eventName"];

GVAR(eventsLocation) setVariable [_eventName, nil];
