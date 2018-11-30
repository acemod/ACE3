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
params ["_object", "_value"];

if (_value isEqualTo 1) then {
    [_object] call FUNC(placeCamouflage);
} else {
    [_object] call FUNC(deleteCamouflage);
};
