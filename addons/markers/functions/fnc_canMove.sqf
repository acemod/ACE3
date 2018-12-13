#include "script_component.hpp"
/*
 * Author: chris579
 * Checks whether the player can move markers.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Whether the player can move markers <BOOL>
 *
 * Example:
 * [] call ace_markers_fnc_canMove
 *
 * Public: No
 */

switch (GVAR(moveRestriction)) do {
    case MOVE_RESTRICTION_NOBODY: {false};
    case MOVE_RESTRICTION_ALL: {true};
    case MOVE_RESTRICTION_ADMINS: {IS_ADMIN};
    case MOVE_RESTRICTION_GROUP_LEADERS: {
        leader ACE_player == ACE_player
    };
    case MOVE_RESTRICTION_GROUP_LEADERS_ADMINS: {
        (leader ACE_player == ACE_player) || IS_ADMIN
    };
    default {true};
}; // return
