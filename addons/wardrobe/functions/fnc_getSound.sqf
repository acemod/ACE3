#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Getter Function for the sound of a change - checks for directional property, if not, get from target.
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
private _cfgDirectional = configFile >> QUOTE(ADDON) >> _classOrigin >> "modifiableTo" >> _classTarget >> "directionalSound";
if (isClass _cfgDirectional) exitWith { [_cfgDirectional] call CBA_fnc_getCfgDataRandom };

// return target's property in wardrobe config
[configFile >> QUOTE(ADDON) >> _classTarget >> "sound"] call CBA_fnc_getCfgDataRandom

