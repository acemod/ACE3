/*
 * Author: marc_book, edited by commy2
 *
 * Checks if a unit is an engineer.
 *
 * Arguments:
 * 0: unit to be checked (object)
 *
 * Return Value:
 * Bool: is the unit an engineer?
 */
#include "script_component.hpp"

PARAMS_1(_unit);

_unit getVariable ["ACE_IsEngineer", getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer") == 1]
