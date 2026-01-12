#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function for the displayName of a change - checks for directional property, if not, get from target.
 * Also checks for alternativeActionName
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 1: Desired variant <CONFIG>
 *
 * Return Value:
 * Display name of the action <STRING>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_getDisplayName
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

// Check for directional property in wardrobe config
private _directional = getText (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalActionName");
if (_directional isNotEqualTo "") exitWith { _directional };

// Check for "alternative Display Name" of targets wardrobe config
private _alternative = getText (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativeActionName");
if (_alternative isNotEqualTo "") exitWith { _alternative };

// return target config displayName
getText (_cfgTarget >> "displayName") // return
