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
    // If the unit had a loop tracking its vitals, restart it locally
    if (_unit getVariable[QGVAR(addedToUnitLoop),false]) then {
        [_unit, true] call FUNC(addVitalLoop);
    };

    if ((_unit getVariable ["ACE_isUnconscious",false]) && {count (_unit getVariable [QGVAR(unconsciousArguments), []]) >= 6}) then {
        private _arguments = (_unit getVariable [QGVAR(unconsciousArguments), []]);
        _arguments set [2, CBA_missionTime];

        [DFUNC(unconsciousPFH), 0.1, _arguments ] call CBA_fnc_addPerFrameHandler;

        _unit setVariable [QGVAR(unconsciousArguments), nil, true];
    };
};
