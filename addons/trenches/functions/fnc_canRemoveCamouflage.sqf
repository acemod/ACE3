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
if !(GVAR(allowCamouflage)) exitWith {false};
(count (_trench getVariable [QGVAR(camouflageObjects), []]) > 0)
