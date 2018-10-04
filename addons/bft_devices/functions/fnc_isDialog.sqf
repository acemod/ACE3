#include "script_component.hpp"
/*
 * Author: Gundy
 *
 * Description:
 *   Check if interface name ends with "dlg" (and therefore assume its a dialog)
 *
 * Arguments:
 *   0: Name of uiNamespace display / dialog variable <STRING>
 *
 * Return Value:
 *   Is interface a dialog <BOOL>
 *
 * Example:
 *   // returns true
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_fnc_isDialog;

 *   // returns false
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_fnc_isDialog;
 *
 * Public: No
 */


params ["_interfaceName"];

// select the last three characters from the interface name
private _subString = _interfaceName select [count _interfaceName - 3];

_subString == "dlg"
