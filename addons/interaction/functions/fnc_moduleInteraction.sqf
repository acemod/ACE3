#include "..\script_component.hpp"
/*
 * Author: bux578
 * Initializes the Interaction module.
 *
 * Arguments:
 * 0: Logic <OBJECT>
 * 1: Units <ARRAY>
 * 2: Activation State <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [logic, ???, activationState] call ace_interaction_fnc_moduleInteraction
 *
 * Public: No
 */

params ["_logic", "", "_activated"];

if (!_activated) exitWith {};

[_logic, QGVAR(enableTeamManagement), "EnableTeamManagement"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(disableNegativeRating), "DisableNegativeRating"] call EFUNC(common,readSettingFromModule);

INFO("Interaction Module Initialized.");
