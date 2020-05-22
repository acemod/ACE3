#include "script_component.hpp"
/*
 * Author: SynixeBrett
 * Statement for the mod sort.
 *
 * Arguments:
 * 0: item config path (CONFIG)
 *
 * Return Value:
 * Number to sort by
 *
 * Public: No
*/

params ["_config"];

getNumber (_config >> "count")
