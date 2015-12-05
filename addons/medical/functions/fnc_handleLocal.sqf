/*
 * Author: Glowbal
 * Called when a unit switched locality
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: Is local <BOOL>
 *
 * ReturnValue:
 * None
 *
 * Public: No
 */


#include "script_component.hpp"

params ["_unit", "_local"];
if (_local) then {
    if (_unit getvariable[QGVAR(addedToUnitLoop),false]) then {
        [_unit, true] call FUNC(addToInjuredCollection);
    };

    if ((_unit getvariable ["ACE_isUnconscious",false]) && {count (_unit getvariable [QGVAR(unconsciousArguments), []]) >= 6}) then {
        private "_arguments";
        _arguments = (_unit getvariable [QGVAR(unconsciousArguments), []]);
        _arguments set [2, ACE_time];

        [DFUNC(unconsciousPFH), 0.1, _arguments ] call CBA_fnc_addPerFrameHandler;

        _unit setvariable [QGVAR(unconsciousArguments), nil, true];
    };
};
