/*
 * Author: marc_book, edited by commy2
 * Checks if a unit is an engineer.
 *
 * Arguments:
 * 0: unit to be checked <OBJECT>
 *
 * Return Value:
 * is the unit an engineer <BOOL>
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_unit"];

_unit getVariable ["ACE_isEngineer", getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer") == 1] // return
