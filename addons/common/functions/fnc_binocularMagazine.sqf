/*
 * Author: commy2
 * Returns the magazine of the units rangefinder.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Magazine of the units binocular <STRING>
 *
 * Example:
 * player call ace_common_fnc_binocularMagazine
 *
 * Public: Yes
 */
#include "script_component.hpp"

ACE_DEPRECATED("ace_common_fnc_binocularMagazine","3.8.0","CBA_fnc_binocularMagazine");

_this call CBA_fnc_binocularMagazine
