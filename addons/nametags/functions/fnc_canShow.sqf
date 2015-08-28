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
 * call ace_nametags_fnc_canShow
 *
 * Public: No
 */
#include "script_component.hpp"

((vehicle ACE_player) != ACE_player) &&
{GVAR(ShowCrewInfo)} &&
{!(vehicle ACE_player isKindOf "ParachuteBase")};
