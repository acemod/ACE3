#include "..\script_component.hpp"
/*
 * Author: Dystopian
 * Returns vehicle fuel amount from config (cached).
 *
 * Arguments:
 * 0: Fuel Source <OBJECT>
 *
 * Return Value:
 * Fuel amount from config <NUMBER>
 *
 * Example:
 * cursorObject call ace_refuel_fnc_getFuelCargo
 *
 * Public: No
 */

params ["_source"];

(uiNamespace getVariable QGVAR(cacheRefuelCargo)) getOrDefault [typeOf _source, REFUEL_DISABLED_FUEL]
