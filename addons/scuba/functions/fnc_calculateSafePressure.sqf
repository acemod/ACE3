/*
 * Author: BaerMitUmlaut
 * Calculates a safe pressure the player can ascend to.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Maximum ambient pressure tolerated <NUMBER>
 */
#include "script_component.hpp"

private _maxPAmbtol = 0;

{
    private _a = GVAR(aValues) select (_forEachIndex * 2);
    private _b = GVAR(aValues) select (_forEachIndex * 2);

    private _pAmbtol = (_x - _a) * _b;
    _maxPAmbtol = _maxPAmbTol max _pAmbtol;
} forEach (ACE_player getVariable QGVAR(compartments));

_maxPAmbtol
