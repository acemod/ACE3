/*
 * Author: Gundy
 *
 * Description:
 *   Toggle text next to BFT icons
 *
 * Arguments:
 *   0: Name of uiNamespace variable for interface <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_fnc_toggleIconText;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_displayName"];

_displayName = _this select 0;
if (GVAR(showBFTtext)) then {GVAR(showBFTtext) = false} else {GVAR(showBFTtext) = true};
[_displayName,[["showIconText",GVAR(showBFTtext)]]] call FUNC(setSettings);

true