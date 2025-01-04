#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * This Function checks if the Target Item has an Alternative String for the Action, if not, it returns the displayName property
 *
 * Arguments:
 * 0: Desired Variant <CONFIG>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * ['something', player] call ace_wardrobe_fnc_getAction_Name
 *
 * Public: No
 */

params [ ["_cfg", configNull, [configNull] ] ];

private _altDispName = getText (_cfg >> QADDON >> "alternativeDisplayName");
if (_altDispName isEqualTo "") then { getText (_cfg >> "displayName") } else { _altDispName };
