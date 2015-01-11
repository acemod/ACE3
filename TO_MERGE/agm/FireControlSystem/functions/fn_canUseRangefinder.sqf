/*
 * Author: commy2
 *
 * Returns true if the laser distance measurement can be read from the engine.
 * 
 * Argument:
 * Nothing
 * 
 * Return value:
 * Boolean (Bool)
 */

!isNull ((uiNamespace getVariable ["AGM_dlgRangefinder", displayNull]) displayCtrl 1713151)
&& {cameraView == "GUNNER"}
