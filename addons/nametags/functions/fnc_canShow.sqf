/*
 * Author: aeroson
 * Checks if crew info can be shown.
 * Might be called several times a second.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * Can show Crew Info <BOOL>
 *
 * Example:
 * call ace_nametags_fnc_doShow
 *
 * Public: No
 */
#include "script_component.hpp"

private ["_player"];

_player = ACE_player;

vehicle _player != _player &&
{GVAR(ShowCrewInfo)} &&
{!(vehicle _player isKindOf "ParachuteBase")};
