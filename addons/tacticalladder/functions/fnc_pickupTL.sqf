#include "script_component.hpp"
/*
 * Author: Rocko, Ruthberg, commy2
 * Pick up tactical ladder
 *
 * Arguments:
 * 0: unit <OBJECT>
 * 1: ladder <OBJECT>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [_unit, _ladder] call ace_tacticalladder_fnc_pickupTL
 *
 * Public: No
 */

params ["_unit", "_ladder"];

if (backpack _unit != "") exitWith {false};

deleteVehicle _ladder;

_unit addBackpack "ACE_TacticalLadder_Pack";

true
