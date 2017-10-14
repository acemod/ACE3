/*
 * Author: Rocko, Ruthberg
 * Deploy tactical ladder
 *
 * Arguments:
 * 0: unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [_unit] call ace_tacticalladder_fnc_deployTL
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

if (backpack _unit != 'ACE_TacticalLadder_Pack') exitWith {};

removeBackpack _unit;


private _pos = _unit modelToWorld [0,0,0];
private _offset = if ((_unit call CBA_fnc_getUnitAnim select 0) == "prone") then { 1 } else {0.8};

_pos set [0, (_pos select 0) + (sin getDir _unit) * _offset];
_pos set [1, (_pos select 1) + (cos getDir _unit) * _offset];
_pos set [2, [_unit] call CBA_fnc_realHeight];

private _ladder = "ACE_TacticalLadder" createVehicle _pos;
_ladder setPos _pos;
_ladder setDir getDir _unit;

_unit reveal _ladder;
