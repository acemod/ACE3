/*
 * Author: Brandon (TCVM)
 * Initializes weapon to disable weapon disassembling
 *
 * Arguments:
 * 0: Weapon <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [weapon] call ace_csw_fnc_weaponInit
 *
 * Public: No
 */
#include "script_component.hpp"

params["_weapon"];

if (isNull(configFile >> "CfgVehicles" >> typeof(_weapon) >> QGVAR(options) >> "enabled") || {getNumber(configFile >> "CfgVehicles" >> typeof(_weapon) >> QGVAR(options) >> "enabled") != 1}) exitWith {};
if (_weapon getVariable[QGVAR(initialized), false]) exitWith {};
if (!(_weapon getVariable[QGVAR(enableCSW), true])) exitWith {};

_weapon enableWeaponDisassembly false;
_weapon setVariable[QGVAR(enableCSW), true];
_weapon setVariable[QGVAR(initialized), true];

