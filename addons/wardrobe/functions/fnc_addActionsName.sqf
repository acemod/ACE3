#include "../script_component.hpp"
/*
 * Author: OverlordZorn
 * This function checks if the target item has an alternative String for the action, if not, it returns the displayName property.
 *
 * Arguments:
 * 0: Desired variant <CONFIG>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * _cfg call ace_wardrobe_fnc_getActionsName
 *
 * Public: No
 */

params [ ["_cfg", configNull, [configNull] ] ];

private _altDispName = getText (configFile >> QUOTE(ADDON) >> configName _cfg >> "alternativeDisplayName");
if (_altDispName isEqualTo "") then { getText (_cfg >> "displayName") } else { _altDispName };
