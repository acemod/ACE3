/*
 * Author: commy2
 * Update compatible info elements.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_fcs_fnc_updateRangeHUD
 *
 * Public: No
 */
#include "script_component.hpp"

disableSerialization;
private _dlgRangefinder = uiNamespace getVariable ["ACE_dlgRangefinder", displayNull];

(_dlgRangefinder displayCtrl 1713151) ctrlSetText ctrlText (_dlgRangefinder displayCtrl 151);
