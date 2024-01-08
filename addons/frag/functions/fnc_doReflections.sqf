#include "script_component.hpp"
/*
 * Author: ACE-Team
 * Dev things
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 *
 * Example:
 * call ace_frag_fnc_doReflections
 *
 * Public: No
 */

params ["_pos", "_ammo", ["_depth", 1]];

// TEST_ICONS pushBack [_pos, format ["EXP!", _hit, _range, _hitFactor]];
if (_depth <= 2) then {
    private _indirectHitRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    private _indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    private _testParams = [_pos, [_indirectHitRange, _indirectHit], [], [], -4, _depth, 0];
    [DFUNC(findReflections), 0, _testParams] call CBA_fnc_addPerFrameHandler;
};
