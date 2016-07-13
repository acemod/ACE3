/*
 * Author: BaerMitUmlaut
 * Simulates physical effects while diving.
 *
 * Arguments:
 * None
 *
 * Return Value:
 * None
 */
#include "script_component.hpp"

[] call FUNC(updateCompartments);
private _safePressure = [] call FUNC(calculateSafePressure);
private _safeDepth = (_safePressure - 1) * 10;

if (_safeDepth > ((getPosASL ACE_player select 2) * -1)) then {
    // Damage here
};
