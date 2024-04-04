#include "..\script_component.hpp"
/*
 * Author: tcvm, veteran29
 * Handles burning reactions of an unit, like screaming or throwing the weapons away due to pain.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 * 1: Should unit throw its current weapon <BOOL>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

params ["_unit", ["_throwWeapon", true]];

if (
    _throwWeapon
    && {GVAR(dropWeapon) > 0}
    && {_unit in _unit && {(currentWeapon _unit) isNotEqualTo ""}}
    && {!isPlayer _unit || GVAR(dropWeapon) >= 2}
) then {
    [_unit] call EFUNC(common,throwWeapon);
};

if (_unit isKindOf "CAManBase") then {
    private _soundID = floor (1 + random 15);
    private _sound = format [QGVAR(scream_%1), _soundID];
    [QGVAR(playScream), [_sound, _unit]] call CBA_fnc_globalEvent;
};
