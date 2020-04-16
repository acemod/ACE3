#include "script_component.hpp"
/*
 * Author: mharis001
 * Initializes the Zeus display.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_ai_fnc_initDisplayCurator
 *
 * Public: No
 */

addMissionEventHandler ["Draw3D", {call FUNC(drawCuratorGarrisonPathing)}];
