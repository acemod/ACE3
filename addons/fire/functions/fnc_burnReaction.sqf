#include "script_component.hpp"
/*
 * Author: Brandon (TCVM), veteran29
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
    GVAR(dropWeapon) > 0
    && {_unit in _unit && { !(currentWeapon _unit isEqualTo "") }}
    && {!isPlayer _unit || GVAR(dropWeapon >= 2)}
) then {
    [_unit] call EFUNC(hitreactions,throwWeapon);
};

private _soundID = floor (1 + random 15);
private _sound = format [QGVAR(scream_%1), _soundID];
[QGVAR(playScream), [_sound, _unit]] call CBA_fnc_globalEvent;
