/*
 * Author: SilentSpike
 * Adds or removes spectator vision modes from the selection available to the local player.
 * The default selection is [-2,-1,0,1].
 * Possible vision modes are:
 *   - -2: Normal
 *   - -1: Night vision
 *   -  0: White hot
 *   -  1: Black hot
 *   -  2: Light Green Hot / Darker Green cold
 *   -  3: Black Hot / Darker Green cold
 *   -  4: Light Red Hot /Darker Red Cold
 *   -  5: Black Hot / Darker Red Cold
 *   -  6: White Hot . Darker Red Col
 *   -  7: Thermal (Shade of Red and Green, Bodies are white)
 *
 * Arguments:
 * 0: Vision modes to add <ARRAY>
 * 1: Vision modes to remove <ARRAY>
 *
 * Return Value:
 * Available vision modes <ARRAY>
 *
 * Example:
 * [[0], [1,2]] call ace_spectator_fnc_updateVisionModes
 *
 * Public: Yes
 */

#include "script_component.hpp"

params [["_addModes",[],[[]]], ["_removeModes",[],[[]]]];

// Restrict additions to only possible values
_addModes = _addModes arrayIntersect [-2,-1,0,1,2,3,4,5,6,7];

// Remove and add new modes
GVAR(availableVisions) = GVAR(availableVisions) - _removeModes;

GVAR(availableVisions) append _addModes;
GVAR(availableVisions) arrayIntersect GVAR(availableVisions);
GVAR(availableVisions) sort true;

GVAR(availableVisions)
