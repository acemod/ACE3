/*
 * Author: KoffeinFlummi, bux578, esteldunedain, commy2
 * Initializes the respawn module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Synced units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic, [ACE_Player], true] call ace_respawn_fnc_module
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(SavePreDeathGear), "SavePreDeathGear"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(RemoveDeadBodiesDisconnected), "RemoveDeadBodiesDisconnected"] call EFUNC(common,readSettingFromModule);

INFO("Respawn Module Initialized.");
