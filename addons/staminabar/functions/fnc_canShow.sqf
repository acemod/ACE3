/*
 * Author: Dslyecxi, Jonpas
 * Checks if the Stamina Bar can be shown.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can Show <BOOL>
 *
 * Example:
 * _canShow = [] call ace_staminabar_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

(alive ACE_player) &&
{!visibleMap} &&
{vehicle ACE_player == ACE_player ||
    ((ACE_player != driver vehicle ACE_player) &&
    (ACE_player != gunner (vehicle ACE_player)) &&
    (ACE_player != commander (vehicle ACE_player)))} &&
{(positionCameraToWorld [0,0,0]) distance ACE_player < 5}
