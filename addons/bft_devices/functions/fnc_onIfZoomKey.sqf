/*
 * Author: Gundy
 *
 * Description:
 *   Called whenever a interface zoom key is pressed. Will zoom in/out map on display interface type.
 *
 * Arguments:
 *   0: 0 = ZoomIn, 1 = ZoomOut <INTEGER>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   0 call ace_bft_devices_fnc_onIfZoomKey
 *
 * Public: No
 */
 
 #include "script_component.hpp"
 
 private [];
 
 systemChat str _this;
 
 true