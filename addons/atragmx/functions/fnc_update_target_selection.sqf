/*
 * Author: Ruthberg
 * Updates all input fields based on the currently selected target
 *
 * Arguments:
 * Nothing
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * call ace_atragmx_fnc_update_target_selection
 *
 * Public: No
 */
#include "script_component.hpp"

(__DSP displayCtrl 500) ctrlEnable true;
(__DSP displayCtrl 501) ctrlEnable true;
(__DSP displayCtrl 502) ctrlEnable true;
(__DSP displayCtrl 503) ctrlEnable true;

(__DSP displayCtrl 500 + GVAR(currentTarget)) ctrlEnable false;

ctrlSetFocus (__DSP displayCtrl 3000);

[] call FUNC(update_unit_selection);
