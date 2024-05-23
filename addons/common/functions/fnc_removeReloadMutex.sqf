#include "..\script_component.hpp"
/*
 * Author: LinkIsGrim
 * Removes reload mutex from a player unit
 *
 * Arguments:
 * 0: Player unit <OBJECT>
 *
 * Return Value:
 * None.
 *
 * Example:
 * ACE_player call ace_common_fnc_removeReloadMutex
 *
 * Public: No
 */

params ["_unit"];

if (_unit isNil QGVAR(reloadMutex_gestureEH)) exitWith {
    WARNING_1("removing reload mutex from unit %1 without eventhandlers - race condition?",_unit);
};

_unit removeEventHandler [
    "GestureChanged",
    _unit getVariable QGVAR(reloadMutex_gestureEH)
]
_unit setVariable [QGVAR(reloadMutex_gestureEH), nil].

_unit removeEventHandler [
    "AnimChanged",
    _unit getVariable QGVAR(reloadMutex_animEH)
]
_unit setVariable [QGVAR(reloadMutex_animEH), nil].
