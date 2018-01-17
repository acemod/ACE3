//fnc_doReflections.sqf
#include "script_component.hpp"

params ["_pos", "_ammo"];

private _depth = 1;
if(count _this > 2) then {
    _depth = _this select 2;
};
// TEST_ICONS pushBack [_pos, format["EXP!", _hit, _range, _hitFactor]];
if(_depth <= 2) then {
    private _indirectHitRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    private _indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    private _testParams = [_pos, [_indirectHitRange, _indirectHit], [], [], -4, _depth, 0];
    [DFUNC(findReflections), 0, _testParams] call CBA_fnc_addPerFrameHandler;
};
