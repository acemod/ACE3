//fnc_doReflections.sqf
#include "script_component.hpp"

private ["_pos", "_ammo", "_depth", "_hit", "_range", "_hitFactor", "_indirectHitRange", "_indirectHit", "_testParams"];

params ["_pos", "_ammo", ["_depth", 1]];

if(_depth <= 2) then {
    _indirectHitRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    _indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");

    _testParams = [_pos, [_indirectHitRange, _indirectHit], [], [], -4, _depth, 0];
    [DFUNC(findReflections), 0, _testParams] call CBA_fnc_addPerFrameHandler;
};
