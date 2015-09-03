/*
 * Author: Glowbal
 * Adds new condition for the unconscious state. Conditions are not actively checked for units unless unit is in unconscious state.
 *
 * Arguments:
 * 0: Code, should return a boolean <CODE>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

if (isnil QGVAR(unconsciousConditions)) then {
    GVAR(unconsciousConditions) = [];
};
if (typeName _this == typeName []) then {
    {
        if (typeName _x == typeName {}) then {
            GVAR(unconsciousConditions) pushback _x;
        };
    }foreach _this;
};
