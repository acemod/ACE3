#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Checks if the unit can drop distant units from their group
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * Unit can drop distant units <BOOL>
 *
 * Example:
 * [player] call ace_interaction_fnc_canGroupDropDistantUnits
 *
 * Public: No
 */

params ["_unit"];

(_unit == leader _unit) && {missionNamespace getVariable [QGVAR(groupDropUnitDistance), 100] > 0}
