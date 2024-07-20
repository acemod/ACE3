#include "..\script_component.hpp"
/*
 * Author: tcvm, veteran29
 * Handles burning reactions of an unit, like screaming or throwing the weapons away due to pain.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit"];

if (
    GVAR(dropWeapon) > 0 &&
    {isNull objectParent _unit} &&
    {(currentWeapon _unit) != ""} &&
    {!isPlayer _unit || GVAR(dropWeapon) == 2}
) then {
    _unit call EFUNC(common,throwWeapon);
};

[QGVAR(playScream), [format [QGVAR(scream_%1), floor (1 + random 15)], _unit]] call CBA_fnc_globalEvent;
