#include "script_component.hpp"
/*
 * Author: Ruthberg
 * Shows/Hides the muzzle velocity data controls
 *
 * Arguments:
 * visible - <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * false call ace_atragmx_fnc_show_muzzle_velocity_data
 *
 * Public: No
 */

GVAR(showMuzzleVelocityData) = _this;

{ctrlShow [_x, _this]} forEach [16000, 16001, 160021, 160022, 160023, 160024, 160025, 160026, 160027, 160031, 160032, 160033, 160034, 160035, 160036, 160037, 16004, 16005, 16006, 16007, 16008, 16009];

if (_this) then {
    ctrlSetFocus ((uiNamespace getVariable "ATragMX_Display") displayCtrl 160031);
    [] call FUNC(update_muzzle_velocity_data);
};
