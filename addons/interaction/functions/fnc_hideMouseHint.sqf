/*
 * Author: Garth de Wet (LH)
 * Hides the interaction helper text with the mouse buttons at the bottom middle of the screen
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_interaction_fnc_hideMouseHint
 *
 * Public: No
 */
#include "script_component.hpp"

if (isNull (uiNamespace getVariable ["ACE_Helper_Display", objNull])) exitWith {};

(QGVAR(InteractionHelper) call BIS_fnc_rscLayer) cutText ["", "PLAIN"];

// Re-enable action menu
inGameUISetEventHandler ["PrevAction", "false"];
inGameUISetEventHandler ["NextAction", "false"];
inGameUISetEventHandler ["Action", "false"];
