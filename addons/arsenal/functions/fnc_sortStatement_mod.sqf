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

(modParams [_config call EFUNC(common,getAddon), ["name"]]) param [0, ""]
