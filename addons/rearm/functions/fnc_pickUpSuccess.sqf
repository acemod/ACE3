/*
 * Author: GitHawk
 * Picks up a magazine
 *
 * Arguments:
 * 0: The Params <ARRAY>
 * 0,0: The Unit <OBJECT>
 * 0,1: The Magazine <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * [[player, "500Rnd_127x99_mag_Tracer_Red"]] call ace_rearm_fnc_pickUpSuccess
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_args"];
_args params ["_unit", "_magazine"];

_unit setVariable [QGVAR(carriedMagazine), _magazine]; // TODO replace by item
