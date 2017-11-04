/*
 * Author: BaerMitUmlaut
 * Lets the unit fast rope.
 *
 * Arguments:
 * 0: Unit occupying the helicopter <OBJECT>
 * 1: The helicopter itself <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_player, _vehicle] call ace_fastroping_fnc_fastRope
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_unit", "_vehicle"];

//Select unoccupied rope
private _deployedRopes = _vehicle getVariable [QGVAR(deployedRopes), []];
private _usableRope = _deployedRopes select 0;
private _usableRopeIndex = 0;
{
    if !(_x select 5) exitWith {
        _usableRope = _x;
        _usableRopeIndex = _forEachIndex;
    };
} forEach _deployedRopes;

_usableRope set [5, true];
_deployedRopes set [_usableRopeIndex, _usableRope];
_vehicle setVariable [QGVAR(deployedRopes), _deployedRopes, true];

//Start server PFH asap
[QGVAR(startFastRope), [_unit, _vehicle, _usableRope, _usableRopeIndex, false]] call CBA_fnc_serverEvent;
moveOut _unit;
[FUNC(fastRopeLocalPFH), 0, [_unit, _vehicle, _usableRope, _usableRopeIndex, diag_tickTime]] call CBA_fnc_addPerFrameHandler;
