/*
    @Authors
        Salbei
    @Arguments
        ?
    @Return Value
        ?
    @Example
        ?
*/

#include "script_component.hpp"

params ["_trench", "_unit"];

if !("ACE_EntrenchingTool" in (_unit call EFUNC(common,uniqueItems))) exitWith {false};
if ((_trench getVariable [QGVAR(progress), 0]) >= 1) exitWith {false};
if !(_trench getVariable [QGVAR(digging), false]) exitWith {false};
if ((_trench getVariable [QGVAR(diggerCount), 0]) < 1) exitWith {false};

true
