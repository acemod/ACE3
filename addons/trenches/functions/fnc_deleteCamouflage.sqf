/*
    @Authors
        Christian 'chris5790' Klemm
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/
#include "script_component.hpp"

params ["_trench"];

private _camouflageObjects = _trench getVariable [QGVAR(camouflageObjects), []];

{
    deleteVehicle _x;
} forEach (_camouflageObjects select 0);

_camouflageObjects deleteAt 0;
_trench setVariable [QGVAR(camouflageObjects), _camouflageObjects, true];
