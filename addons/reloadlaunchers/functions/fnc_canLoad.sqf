#include "..\script_component.hpp"
/*
 * Author: commy2, johnb43
 * Check if the unit can reload the launcher of the target unit.
 *
 * Arguments:
 * 0: Unit wanting to execute the reload <OBJECT>
 * 1: Unit equipped with the launcher <OBJECT>
 * 2: Launcher name <STRING>
 * 3: Missile name <STRING>
 *
 * Return Value:
 * Can Load <BOOL>
 *
 * Example:
 * [player, cursorTarget, "launch_RPG32_F", "RPG32_F"] call ace_reloadlaunchers_fnc_canLoad
 *
 * Public: No
 */

params ["_unit", "_target", "_weapon", "_magazine"];
TRACE_4("params",_unit,_target,_weapon,_magazine);

// Target must be awake
if !(_target call EFUNC(common,isAwake)) exitWith {false};

// Target must not be in a vehicle
if !(isNull objectParent _target) exitWith {false};
if !([_unit, _target, ["isNotInside", "isNotSwimming"]] call EFUNC(common,canInteractWith)) exitWith {false};

// Target must not be captive
if (_target getVariable [QEGVAR(captives,isHandcuffed), false] || {_target getVariable [QEGVAR(captives,isSurrendering), false]}) exitWith {false};

// Check if the launcher is compatible
if (getNumber (configFile >> "CfgWeapons" >> _weapon >> QGVAR(enabled)) == 0) exitWith {false};

// Check if target has its secondary weapon equipped
if !(_weapon in weapons _target) exitWith {false};

// Check if the target's launcher's primary muzzle really needs to be reloaded
if (_target ammo _weapon != 0) exitWith {false};

// Check if the magazine is compatible with target's launcher
_magazine in ([_unit, _weapon] call FUNC(getLoadableMissiles))
