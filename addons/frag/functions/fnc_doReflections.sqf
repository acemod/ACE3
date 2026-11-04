#include "..\script_component.hpp"
/*
 * Author: ACE-Team
 * Starts a PFH that finds blast reflections for an explosion.
 *
 * Arguments:
 * 0: Position ASL <ARRAY>
 * 1: Ammo classname <STRING>
 * 2: Depth <NUMBER> (default: 1)
 *
 * Return Value:
 * None
 *
 * Example:
 * [getPosASL player, "R_80mm_HE"] call ace_frag_fnc_doReflections
 *
 * Public: No
 */

params ["_pos", "_ammo", ["_depth", 1]];

// TEST_ICONS pushBack [_pos, format ["EXP!", _hit, _range, _hitFactor]];
if (_depth <= 2) then {
    private _indirectHitRange = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHitRange");
    private _indirectHit = getNumber(configFile >> "CfgAmmo" >> _ammo >> "indirectHit");
    private _testParams = [_pos, [_indirectHitRange, _indirectHit], [], [], -4, _depth, 0];
    [LINKFUNC(findReflections), 0, _testParams] call CBA_fnc_addPerFrameHandler;
};
