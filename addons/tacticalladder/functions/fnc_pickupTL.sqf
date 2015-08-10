/*
 * Author: Rocko, Ruthberg
 * Pick up tactical ladder
 *
 * Arguments:
 * 0: ladder <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Success <BOOL>
 *
 * Example:
 * [_ladder, _unit] call ace_tacticalladder_fnc_pickupTL
 *
 * Public: No
 */
#include "script_component.hpp"

if ((backpack ACE_player) != "") exitWith { false };

params ["_ladder", "_unit"];

deleteVehicle _ladder;
_unit addBackpack "ACE_TacticalLadder_Pack";

true
