/*
 * Author: Glowbal
 * Disables the user input. Works stacked.
 *
 * Arguments:
 * 0: id <STRING>
 * 1: disable <BOOL>
 *
 * Return Value:
 * None
 *
 * Example:
 * ["id", true] call ace_common_fnc_setDisableUserInputStatus
 *
 * Public: Yes
 */
#include "script_component.hpp"

params ["_id", "_disable"];

if (isNil QGVAR(DISABLE_USER_INPUT_COLLECTION)) then {
    GVAR(DISABLE_USER_INPUT_COLLECTION) = [];
};

if (_disable) then {
    GVAR(DISABLE_USER_INPUT_COLLECTION) pushBack _id;
    [true] call FUNC(disableUserInput);
} else {
    GVAR(DISABLE_USER_INPUT_COLLECTION) = GVAR(DISABLE_USER_INPUT_COLLECTION) - [_id];
    if (GVAR(DISABLE_USER_INPUT_COLLECTION) isEqualTo []) then {
        [false] call FUNC(disableUserInput);
    };
};
