/*
 * Author: Gundy
 *
 * Description:
 *   Called whenever a interface toggle (open/close) key is pressed. Based on situation will open or close the interface for a BFT device
 *
 * Arguments:
 *   0: 0 = Primary, 1 = Secondary, 3 = Tertiary <INTEGER>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   0 call ace_bft_devices_fnc_onIfToggleKey
 *
 * Public: No
 */
 
 #include "script_component.hpp"
 
 private [];
 
 systemChat str _this;
 
 true