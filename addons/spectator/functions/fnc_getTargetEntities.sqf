/*
 * Author: SilentSpike
 * Gets the possible entities to spectate based on settings
 *
 * Public: No
 */

#include "script_component.hpp"

private _entities = [];

// AI filter
if (GVAR(filterUnits) == 3) then {
    _entities = allUnits;
} else {
    _entities = [] call CBA_fnc_players;
};

// Side and number of units filter
_entities select {
    ((side group _x) in GVAR(availableSides)) &&
    {simulationEnabled _x && {simulationEnabled vehicle _x}} &&
    { !isObjectHidden _x && {!isObjectHidden vehicle _x} }
}
