#include "..\script_component.hpp"
/*
 * Author: JetfireBlack
 * Toggles respirator filter
 *
 * Arguments:
 * 0: Optional unit <OBJECT> (default: ACE_player)
 *
 * Return Value:
 * None
 *
 * Examples:
 * [player] call ace_goggles_fnc_respiratorFilter
 * call ace_goggles_fnc_respiratorFilter
 *
 * Public: Yes
 */
 
params [["_unit", ACE_player, [objNull]]];

if (!local _unit) exitWith {};

private _goggles = goggles _unit;

_unit linkItem (GVAR(respiratorPairs) get _goggles);
