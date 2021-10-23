#include "script_component.hpp"
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

// Select random animation from Animations Pool
selectRandom [
    QGVAR(HubSittingChairA_idle1),
    QGVAR(HubSittingChairA_idle2),
    QGVAR(HubSittingChairA_idle3),
    QGVAR(HubSittingChairA_move1),
    QGVAR(HubSittingChairB_idle1),
    QGVAR(HubSittingChairB_idle2),
    QGVAR(HubSittingChairB_idle3),
    QGVAR(HubSittingChairB_move1),
    QGVAR(HubSittingChairC_idle1),
    QGVAR(HubSittingChairC_idle2),
    QGVAR(HubSittingChairC_idle3),
    QGVAR(HubSittingChairC_move1),
    QGVAR(HubSittingChairUA_idle1),
    QGVAR(HubSittingChairUA_idle2),
    QGVAR(HubSittingChairUA_idle3),
    QGVAR(HubSittingChairUA_move1),
    QGVAR(HubSittingChairUB_idle1),
    QGVAR(HubSittingChairUB_idle2),
    QGVAR(HubSittingChairUB_idle3),
    QGVAR(HubSittingChairUB_move1),
    QGVAR(HubSittingChairUC_idle1),
    QGVAR(HubSittingChairUC_idle2),
    QGVAR(HubSittingChairUC_idle3),
    QGVAR(HubSittingChairUC_move1)
]
