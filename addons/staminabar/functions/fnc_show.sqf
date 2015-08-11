/*
 * Author: Dslyecxi, Jonpas
 * Shows the Stamina Bar and starts the update PFH.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_staminabar_fnc_show
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_barDisplay", "_ctrlBack", "_ctrlBar"];

// Draw bar
(QGVAR(Bar) call BIS_fnc_rscLayer) cutRsc [QGVAR(Bar), "PLAIN"];

// Get display
disableSerialization;
_barDisplay = uiNamespace getVariable [QGVAR(barDisplay), displayNull];

// Exit if display does not exist
if (isNull _barDisplay) exitWith {ERROR("Stamina Bar display is null")};

// Extracts controls and start PFH
_ctrlBack = _barDisplay displayCtrl 2202;
_ctrlBar = _barDisplay displayCtrl 2203;
[FUNC(updatePFH), 0, [_ctrlBack, _ctrlBar]] call CBA_fnc_addPerFrameHandler;
