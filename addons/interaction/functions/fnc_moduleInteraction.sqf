/*
 * Author: bux578
 * Initializes the Interaction module
 *
 * Arguments:
 * 0: Logic <NUMBER>
 * 1: ???
 * 2: Activation State <BOOL>
 *
 * Return value:
 * None
 *
 * Example:
 * [logic, ???, activationState] call ace_interaction_fnc_moduleInteraction
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_logic", "_activated"];

_logic = _this select 0;
_activated = _this select 2;

if !(_activated) exitWith {};

[_logic, QGVAR(EnableTeamManagement), "EnableTeamManagement"] call EFUNC(common,readSettingFromModule);

ACE_LOGINFO("Interaction Module Initialized.");
