#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Text statement for hearing protection.
 *
 * Arguments:
 * 0: Item config path <CONFIG>
 *
 * Return Value:
 * Stat Text <STRING>
 *
 * Public: No
*/

params ["_config"];

["", LLSTRING(statEHP)] select (getNumber (_config >> QGVAR(hasEHP)))
