/*
 * Author: Gundy
 *
 * Description:
 *   Increases interface brightness
 *
 * Arguments:
 *   0: Name of uiNamespace display / dialog variable <STRING>
 *
 * Return Value:
 *   TRUE <BOOL>
 *
 * Example:
 *   ["ace_bft_devices_TAD_dlg"] call ace_bft_devices_incTextSize;
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_brightness", "_displayName"];

_displayName = _this select 0;
_brightness = [_displayName,"brightness"] call FUNC(getSettings);
_brightness = _brightness + 0.1;
// make sure brightness is not larger than 1
if (_brightness > 1) then {_brightness = 1};
[_displayName,[["brightness",_brightness]]] call FUNC(setSettings);

true