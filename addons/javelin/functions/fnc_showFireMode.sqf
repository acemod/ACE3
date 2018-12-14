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

(if (((vehicle ACE_player) == ACE_player) || {ACE_player call CBA_fnc_canUseWeapon}) then {
    weaponState ACE_player
} else {
    _turretPath = if (ACE_player == (driver _currentShooter)) then {[-1]} else {ACE_player call CBA_fnc_turretPath};
    weaponState [vehicle ACE_player, _turretPath]
}) params ["_weapon", "", "_mode"];

private _currentFireMode = getText (configFile >> "CfgWeapons" >> _weapon >> _mode >> QEGVAR(missileGuidance,attackProfile));

TRACE_3("showFireMode",_weapon,_mode,_currentFireMode);

if (_currentFireMode == "JAV_TOP") then {
    __JavelinIGUITop ctrlSetTextColor __ColorGreen;
    __JavelinIGUIDir ctrlSetTextColor __ColorGray;
} else {
    __JavelinIGUITop ctrlSetTextColor __ColorGray;
    __JavelinIGUIDir ctrlSetTextColor __ColorGreen;
};
