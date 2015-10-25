/*
 * Author: Jaynus
 * Fired EventHandler for Javelin
 *
 * Arguments:
 * 0: Shooter <OBJECT>
 * 1: Weapon <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_javelin_fnc_onFire
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_shooter", "_weapon"];

// Bail on not missile or javelin PFEH not running
if ((_shooter != ACE_player) || {(GVAR(pfehID) == -1)}) exitWith { false };

private ["_configs"];

_configs = configProperties [configFile >> "CfgWeapons" >> _weapon, QUOTE(configName _x == QUOTE(QGVAR(enabled))), false];
if (((count _configs) < 1) || {(getNumber (_configs select 0)) != 1}) exitWith {};

__JavelinIGUITargeting ctrlShow false;
__JavelinIGUITargetingGate ctrlShow false;
__JavelinIGUITargetingLines ctrlShow false;
__JavelinIGUITargetingConstraints ctrlShow false;
