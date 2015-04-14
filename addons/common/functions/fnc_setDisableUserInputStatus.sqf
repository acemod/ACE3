/**
 * fn_setDisableUserInputStatus.sqf
 * @Descr: Disables the user input. Works stacked.
 * @Author: Glowbal
 *
 * @Arguments: [id STRING, disable BOOL]
 * @Return: void
 * @PublicAPI: true
 */
#include "script_component.hpp"
private ["_id","_disable"];
_id = _this select 0;
_disable = _this select 1;


if (isnil QGVAR(DISABLE_USER_INPUT_COLLECTION)) then {
    GVAR(DISABLE_USER_INPUT_COLLECTION) = [];
};

if (_disable) then {
    GVAR(DISABLE_USER_INPUT_COLLECTION) pushback _id;
    [true] call FUNC(disableUserInput);
} else {
    GVAR(DISABLE_USER_INPUT_COLLECTION) = GVAR(DISABLE_USER_INPUT_COLLECTION) - [_id];
    if (GVAR(DISABLE_USER_INPUT_COLLECTION) isEqualTo []) then {
        [false] call FUNC(disableUserInput);
    };
};