/*
 * Author: commy2
 * Check if the unit can unload a captive from the vehicle.
 *
 * Arguments:
 * 0: Unit that wants to unload a captive (player) <OBJECT>
 * 1: A captive loaded in a vehicle <OBJECT>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_canUnloadCaptive;
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_player", "_unit"];

// Don't show "Unload Captive" if unit is unconscious (already has "Unload Patient")
(vehicle _unit != _unit) && {vehicle _player == _player} && {_unit getVariable [QGVAR(isHandcuffed), false]} && {!(_unit getVariable ["ACE_isUnconscious", false])}
