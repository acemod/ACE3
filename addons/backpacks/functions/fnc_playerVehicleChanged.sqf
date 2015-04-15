#include "script_component.hpp"

private ["_unit", "_holder"];

_unit = _this select 0;
_holder = _unit getVariable ["ACE_Backpack", objNull];

if (vehicle _unit != _unit) then {
    if (vehicle _unit isKindOf "ParachuteBase") then {
        _holder attachTo [vehicle _unit, [-0.12,0.65,-0.15]];
        _holder setVectorDirAndUp [[0,-0.2,-1],[0,1,0]];
    } else {
        _holder setPos [0, 0, 200];
    };
} else {
    _holder attachTo [_unit, [-0.1,0.8,-0.05], "Pelvis"];
    _holder setVectorDirAndUp [[0, 0, -1], [0, 1, 0]];
};