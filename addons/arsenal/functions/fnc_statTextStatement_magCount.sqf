#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Text statement for the magazine capacity stat.
 *
 * Arguments:
 * 0: Stats Array <ARRAY> (not used)
 * 1: Item config path <CONFIG>
 *
 * Return Value:
 * String to display
 *
 * Public: No
*/

params ["", "_config"];
TRACE_1("statTextStatement_magCount",_config);

getNumber (_config >> "count");
