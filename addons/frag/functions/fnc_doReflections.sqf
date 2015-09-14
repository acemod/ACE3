//fnc_doReflections.sqf
#include "script_component.hpp"

private ["_pos", "_ammo", "_depth", "_hit", "_range", "_hitFactor", "_indirectHitRange", "_indirectHit", "_testParams"];

_pos = _this select 0;
_ammo = _this select 1;
_depth = 1;
if(count _this > 2) then {
    _depth = _this select 2;
};
// TEST_ICONS pushBack [_pos, format["EXP!", _hit, _range, _hitFactor]];
if(_depth <= 2) then {
    _indirectHitRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    _indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    
    
    
    
    _testParams = [_pos, [_indirectHitRange, _indirectHit], [], [], -4, _depth, 0];
    [DFUNC(findReflections), 0, _testParams] call CBA_fnc_addPerFrameHandler;
};
