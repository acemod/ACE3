#include "..\script_component.hpp"
/*
 * Author: PabstMirror
 * Drops distance units from their group
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Example:
 * [player] call ace_interaction_fnc_groupDropDistantUnits
 *
 * Public: No
 */

params ["_unit"];

{
    if ((_x distance _unit) > (missionNamespace getVariable [QGVAR(groupDropUnitDistance), 100])) then {
        TRACE_1("drop",_x);
        [_x] joinSilent grpNull;
    };
} forEach (units group _unit);
