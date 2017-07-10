/*
 * Author: chris579
 * Handles the Arma rating system to prevent friendly fire e.g. when crashing a friendly helicopter
 *
 * Arguments:
 * 0: The module logic <OBJECT>
 * 1: Synchronized units <ARRAY>
 * 2: Activated <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [LOGIC, [bob, kevin], true] call ace_rating_fnc_moduleRatingSettings
 *
 * Public: No
 */

#include "script_component.hpp"

params ["_logic", "_units", "_activated"];

if !(_activated) exitWith {};

[_logic, QGVAR(allowNegativeRatingPlayers), "allowNegativeRatingPlayers"] call EFUNC(common,readSettingFromModule);
[_logic, QGVAR(allowNegativeRatingAi), "allowNegativeRatingAi"] call EFUNC(common,readSettingFromModule);
