#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * This function checks if the target item has an directional or alternative action name for the action, if not, it returns the displayName property.
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 0: Desired variant <CONFIG>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_getActionsName
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

// Check if there is a "directional Display Name", meaning if there is a specific string when changing from a certain class to a certain class
private _directional = getText (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalActionName");
if (_directional isNotEqualTo "") exitWith { _directional };

// Check if there is an "alternative Display Name", defined by the ace_wardrobe base class
private _alternative = getText (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativeActionName");
if (_alternative isNotEqualTo "") exitWith { _alternative };

// return
getText (_cfgTarget >> "displayName")
