#include "..\script_component.hpp"
/*
 * Author: esteldunedain / Cyruz / diwako
 * Handles casing/dropped mag creation.
 *
 * Arguments:
 * 0: Unit - Unit to create litter for <OBJECT>
 * 1: Model - Path to litter model <STRING>
 * 2: Force creation - Skip the distance + RNG check <BOOL> (default: false)
 *
 * Return Value:
 * None
 *
 * Example:
 * [player, "\a3\weapons_f\mag_univ.p3d"] call ace_casings_fnc_createLitter
 *
 * Public: No
 */

params ["_unit", "_modelPath", ["_force", false]];

if (_modelPath == "") exitWith {};

private _unitPos = getPosASL _unit;
// Distant shooters don't produce as many cases
if (!_force && {(AGLToASL positionCameraToWorld [0,0,0]) vectorDistance _unitPos > 100 && {random 1 < 0.9}}) exitWith {};

private _weapDir = _unit weaponDirection currentWeapon _unit;
private _ejectDir = _weapDir vectorCrossProduct [0, 0, 1];
private _pos = _unitPos
    vectorAdd (_weapDir vectorMultiply (-0.5 + random 2))
    vectorAdd (_ejectDir vectorMultiply (0.2 + random 2));

[
    {
        params ["_modelPath", "_pos"];
        TRACE_2("creating litter",_modelPath,_pos);

        private _lisPos = (lineIntersectsSurfaces [_pos, _pos vectorAdd [0,0,-1e11], objNull, objNull, true, 1, "ROADWAY", "FIRE"]) #0;
        private _casing = createSimpleObject [_modelPath, (_lisPos #0 vectorAdd [0,0,0.010]), false]; // global
        _casing setDir (random 360);
        _casing setVectorUp _lisPos #1;
        private _idx = GVAR(casings) pushBack _casing;

        for "_" from 0 to (_idx - GVAR(maxCasings)) do {
            deleteVehicle (GVAR(casings) deleteAt 0);
        };
    },
    [_modelPath,_pos],
    0.4
] call CBA_fnc_waitAndExecute;
