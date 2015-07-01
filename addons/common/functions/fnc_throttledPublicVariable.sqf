/*
 * Author: esteldunedain
 * Schedules the publishment of an object variable to reduce network overhead
 *
 * Arguments:
 * 0: Unit <OBJECT>.
 * 1: Variable name <STRING>
 * 2: Maximum delay <NUMBER>
 *
 * Return Value:
 * None
 *
 * Example:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_unit,_varName,_maxDelay);

// Create the publish scheduler PFH the first ACE_time
if (isNil QGVAR(publishSchedId)) then {

    GVAR(publishVarNames) = [];
    GVAR(publishNextTime) = 1e7;

    GVAR(publishSchedId) = [{

        if (ACE_diagTime > GVAR(publishNextTime)) then {
            {
                EXPLODE_2_PVT(_x,_unit,_varName);
                _unit setVariable [_varName, (_unit getVariable _varName), true];
            } forEach GVAR(publishVarNames);

            GVAR(publishVarNames) = [];
            GVAR(publishNextTime) = 1e7;
        };
    }, 0, []] call cba_fnc_addPerFrameHandler;
};

// If the variable is not on the list
if (GVAR(publishVarNames) find [_unit,_varName] == -1) exitWith {
    GVAR(publishVarNames) pushBack [_unit,_varName];
    GVAR(publishNextTime) = GVAR(publishNextTime) min (ACE_diagTime + _maxDelay);
};

// If the variable is on the list
GVAR(publishNextTime) = GVAR(publishNextTime) min (ACE_diagTime + _maxDelay);