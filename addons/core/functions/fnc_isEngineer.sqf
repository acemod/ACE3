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

private "_unit";

_unit = _this select 0;

_unit getVariable ["AGM_IsEngineer", getNumber (configFile >> "CfgVehicles" >> typeOf _unit >> "engineer") == 1]
