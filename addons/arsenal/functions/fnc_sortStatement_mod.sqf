#include "..\script_component.hpp"
/*
 * Author: Brett Mayson, johnb43
 * Statement to sort items by the mod they belong to.
 *
 * Arguments:
 * 0: Item Config <CONFIG>
 *
 * Return Value:
 * Mod Name to Sort By <STRING>
 *
 * Public: No
*/

params ["_config"];

private _addon = _config call EFUNC(common,getAddon);

// Calling modParams with "" prints 'ModParams - Undefined or empty mod directory' in RPT
if (_addon == "") exitWith {""};

(modParams [_addon, ["name"]]) param [0, ""]
