/*
 * Author: Glowbal
 * Called when a unit switched locality
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is local <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * [bob, true] call ACE_medical_fnc_handleLocal
 *
 * Public: No
 */


#include "script_component.hpp"

params ["_unit", "_local"];
if (_local) then {
    if ((_unit getVariable ["ACE_isUnconscious",false]) && {count (_unit getVariable [QGVAR(unconsciousArguments), []]) >= 6}) then {
        private _arguments = (_unit getVariable [QGVAR(unconsciousArguments), []]);
        _arguments set [2, CBA_missionTime];

        _unit setVariable [QGVAR(unconsciousArguments), nil, true];
    };
};
