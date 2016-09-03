/*
 * Author: Gundy
 *
 * Description:
 *   Resets interface when player character has changed (Zeus / remote control of AI units)
 *
 * Arguments:
 *   NONE
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   [] call ace_bft_devices_fnc_onPlayerChanged;
 *
 * Public: No
 */

#include "script_component.hpp"

// close any interface that might still be open
[] call FUNC(ifclose);

// remove msg notification
GVAR(rscLayerMailNotification) cutText ["", "PLAIN"];

true