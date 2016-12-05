/*
 * Author: BaerMitUmlaut
 * Handles a unit entering cardiac arrest.
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

_unit setVariable [QGVAR(cardiacArrestStart), CBA_missionTime];

[_unit] call FUNC(setCardiacArrest);
