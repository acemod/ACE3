/*
 * Author: BaerMitUmlaut
 * Updates the inert gas pressure in each compartment.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

private _compartments = ACE_player getVariable [QGVAR(compartments), [0.745,0.745,0.745,0.745,0.745,0.745,0.745,0.745]];

{
    private _pBegin = _x;
    private _pGas = ACE_player getVariable QGVAR(nitrogenPressure);
    private _tExposure = 1/60;
    private _tHalftime = GVAR(halftimes) select (_forEachIndex * 2);
    
    // Bühlmann algorithm
    private _pComp = _pBegin + (_pGas - _pBegin) * (1 - 2 ^ (-1 * _tExposure / _tHalftime));

    _compartments set [_forEachIndex, _pComp];
} forEach _compartments;

ACE_player setVariable [QGVAR(compartments), _compartments];
