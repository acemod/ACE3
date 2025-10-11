#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * Condition check if the unit can modify from current variant to target variant. Checks and compares components.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Current variant <CONFIG>
 * 2: Desired variant <CONFIG>
 *
 * Return Value:
 * True, if origin can be modified to target <BOOL>
 *
 * Example:
 * [player, configFile >> "CfgWeapons" >> "U_B_CTRG_1", configFile >> "CfgWeapons" >> "U_B_CTRG_3"] call ace_wardrobe_fnc_checkMissingComponents
 *
 * Public: No
 */

params ["_player", "_cfgOrigin", "_cfgTarget"];

private _missing = ([configName _cfgOrigin, configName _cfgTarget] call FUNC(compareComponents)) select 0;
private _currentItems = uniqueUnitItems [_player];

_missing findIf { ! (_x in _currentItems) } == -1 // return
