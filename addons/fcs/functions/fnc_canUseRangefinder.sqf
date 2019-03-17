#include "script_component.hpp"
/*
 * Author: commy2
 * Returns true if the laser distance measurement can be read from the engine.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Boolean <BOOL>
 *
 * Example:
 * call ace_fcs_fnc_canUseRangeFinder
 *
 * Public: No
 */

!isNull ((uiNamespace getVariable ["ACE_dlgRangefinder", displayNull]) displayCtrl 1713151)
&& {cameraView == "GUNNER"} // return
