#include "script_component.hpp"
/*
 * Author: jaynus
 * Updates fire mode on javelin display (top/dir)
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * [] call ace_javelin_fnc_showFireMode
 *
 * Public: No
 */

private _currentShooter = if (ACE_player call CBA_fnc_canUseWeapon) then {ACE_player} else {vehicle ACE_player};
private _currentFireMode = _currentShooter getVariable ["ace_missileguidance_attackProfile", "JAV_TOP"];

TRACE_1("showFireMode", _currentFireMode);

if (_currentFireMode == "JAV_TOP") then {
    __JavelinIGUITop ctrlSetTextColor __ColorGreen;
    __JavelinIGUIDir ctrlSetTextColor __ColorGray;
} else {
    __JavelinIGUITop ctrlSetTextColor __ColorGray;
    __JavelinIGUIDir ctrlSetTextColor __ColorGreen;
};
