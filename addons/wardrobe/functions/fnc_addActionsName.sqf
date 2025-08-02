#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Selects the display name for the action from the alternativeActionName property or the item itself.
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 1: Desired variant <CONFIG>
 *
 * Return Value:
 * Display name of the action <BOOL>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_addActionsName
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

// Check if there is a "directional Display Name", meaning if there is a
// specific display name for changing from one class to the other
private _directional = getText (configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalActionName");
if (_directional isNotEqualTo "") exitWith { _directional };

// Check if there is an "alternative Display Name", defined by the ace_wardrobe base class
private _alternative = getText (configFile >> QUOTE(ADDON) >> _classTarget >> "alternativeActionName");
if (_alternative isNotEqualTo "") exitWith { _alternative };

getText (_cfgTarget >> "displayName") // return
