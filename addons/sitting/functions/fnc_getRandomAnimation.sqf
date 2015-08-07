/*
 * Author: Jonpas
 * Gets a random animations from the list.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Random Animation <STRING>
 *
 * Example:
 * _animation = call ace_sitting_fnc_getRandomAnimation
 *
 * Public: No
 */
#include "script_component.hpp"

private "_animations";

// Animations Pool
_animations = [
    "HubSittingChairUA_idle1",
    "HubSittingChairUA_idle2",
    "HubSittingChairUA_idle3",
    "HubSittingChairUA_move1",
    "HubSittingChairUB_idle1",
    "HubSittingChairUB_idle2",
    "HubSittingChairUB_idle3",
    "HubSittingChairUB_move1",
    "HubSittingChairUC_idle1",
    "HubSittingChairUC_idle2",
    "HubSittingChairUC_idle3",
    "HubSittingChairUC_move1",
    "HubSittingChairA_idle1",
    "HubSittingChairA_idle2",
    "HubSittingChairA_idle3",
    "HubSittingChairA_move1",
    "HubSittingChairB_idle1",
    "HubSittingChairB_idle2",
    "HubSittingChairB_idle3",
    "HubSittingChairB_move1",
    "HubSittingChairC_idle1",
    "HubSittingChairC_idle2",
    "HubSittingChairC_idle3",
    "HubSittingChairC_move1"
];

// Select random animation
(_animations select (floor (random (count _animations))))
