#include "script_component.hpp"
/*
 * Author: Whigital
 * Clears cached variable containing placeable explosives.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Corspe <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 *
 * Public: No
 */

params [
    "_unit",
    "_corpse"
];

TRACE_2("params",_unit,_corpse);

if (_unit == player) then {
    [
        {ACE_player == player},
        {[ACE_player, QGVAR(explosiveActions)] call EFUNC(common,eraseCache);}
    ] call CBA_fnc_waitUntilAndExecute;
};
