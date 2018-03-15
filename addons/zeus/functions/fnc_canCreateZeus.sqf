/*
 * Author: Dystopian
 * Check if zeus can be created.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can create zeus
 *
 * Example:
 * call ace_zeus_fnc_canCreateZeus
 *
 * Public: No
 */
#include "script_component.hpp"

switch (GVAR(canCreateZeus)) do {
    case CAN_CREATE_ADMIN:   {isServer || {IS_ADMIN_LOGGED}};
    case CAN_CREATE_CONSOLE: {call BIS_fnc_isDebugConsoleAllowed};
    case CAN_CREATE_ALL:     {true};
    default {false};
}
