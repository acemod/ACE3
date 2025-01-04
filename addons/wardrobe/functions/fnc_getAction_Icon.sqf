#include "../script_component.hpp"

/*
 * Author: OverlordZorn
 * This Function checks if the Target Item has an alternative Picture for the Action, if not, it returns the picture property
 *
 * Arguments:
 * 0: Config of desired Variant <CONFIG>
 *
 * Return Value:
 * Path to Icon or "" <STRING>
 *
 * Example:
 * [_cfg] call ace_wardrobe_fnc_getAction_Icon
 *
 * Public: No
 */

params [ ["_cfg", configNull, [configNull] ] ];

if (isNull _cfg) exitWith {};

private _altDispIcon = getText (_cfg >> QADDON >> "alternativePicture");
if (_altDispIcon isEqualTo "") then { getText (_cfg >> "picture") } else { _altDispIcon }
