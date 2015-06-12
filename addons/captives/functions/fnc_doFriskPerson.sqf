/*
 * Author: bux578
 * Open gear of given unit
 *
 * Arguments:
 * 0: player unit <OBJECT>
 * 1: unit <OBJECT>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * [player, bob] call ACE_captives_fnc_doFristPerson;
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_weapon", "_listedItemClasses", "_actions", "_allGear"];

PARAMS_2(_player,_unit);

_player action ["Gear", _unit];