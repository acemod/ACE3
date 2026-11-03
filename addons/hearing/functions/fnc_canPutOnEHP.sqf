#include "..\script_component.hpp"
/*
 * Author: BaerMitUmlaut
 * Checks if the unit can put on electronic hearing protection.
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Can put on electronic hearing protection <BOOL>
 *
 * Example:
 * [player] call ace_hearing_fnc_canPutOnEHP
 *
 * Public: No
 */
params ["_unit"];

GVAR(enableCombatDeafness)
&& {!(_unit getVariable ["ACE_hasEHP", false])}
&& {[_unit, "ACE_EHP"] call EFUNC(common,hasItem)}
&& {(headgear _unit == "") || {getNumber (configFile >> "CfgWeapons" >> headgear _unit >> QGVAR(hasEHP)) == 0}}
&& {(goggles _unit == "") || {getNumber (configFile >> "CfgGlasses" >> goggles _unit >> QGVAR(hasEHP)) == 0}}
