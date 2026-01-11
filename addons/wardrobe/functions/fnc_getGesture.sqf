#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function for the gesture of a change - checks for directional property, if not, get from target.
 *
 * Arguments:
 * 0: Current variant <CONFIG>
 * 1: Desired variant <CONFIG>
 *
 * Return Value:
 * Display name of the action <STRING>
 *
 * Example:
 * [(configFile >> "CfgWeapons" >> "U_B_CTRG_3"), (configFile >> "CfgWeapons" >> "U_B_CTRG_1")] call ace_wardrobe_fnc_getDuration
 *
 * Public: No
 */

params ["_cfgOrigin", "_cfgTarget"];

private _classOrigin = configName _cfgOrigin;
private _classTarget = configName _cfgTarget;

// Check for directional property in wardrobe config
private _cfgDirectional = configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalGesture";
if (isClass _cfgDirectional) exitWith { getText _cfgDirectional };

// return target's property in wardrobe config
getText (configFile >> QUOTE(ADDON) >> _classTarget >> "gesture") // return
