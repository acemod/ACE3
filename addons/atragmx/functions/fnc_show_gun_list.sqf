/*
 * Author: Ruthberg
 * Shows/Hides the gun list controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_gun_list
 *
 * Public: No
 */
#include "script_component.hpp"

GVAR(showGunList) = _this;

{ctrlShow [_x, _this]} forEach [6000, 6001, 6002, 6003, 6004, 6005, 6006, 6007];

if (_this) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 6002);
    lbSetCurSel [6000, GVAR(currentGun)];
};
