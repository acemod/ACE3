#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Check if the unit can pass their launcher.
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Player (with the launcher) <OBJECT>
 *
 * Return Value:
 * Can Pass <BOOL>
 *
 * Example:
 * [cursorTarget, player] call ace_reloadlaunchers_fnc_passLauncherCondition
 *
 * Public: No
 */

params ["_target", "_player"];
TRACE_2("params",_target,_player);

((secondaryWeapon _target) == "") && {
((secondaryWeapon _player) != "") && {
(_target call EFUNC(common,isAwake)) && { // Target must be awake
(isNull objectParent _target) && { // Target must not be in a vehicle
!(_target getVariable [QEGVAR(captives,isHandcuffed), false] || {_target getVariable [QEGVAR(captives,isSurrendering), false]}) // Target must not be captive
}}}}
