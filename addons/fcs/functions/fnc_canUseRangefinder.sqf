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
 * Public: No
 */
#include "script_component.hpp"

!isNull ((uiNamespace getVariable ["ACE_dlgRangefinder", displayNull]) displayCtrl 1713151)
&& {cameraView == "GUNNER"} // return
