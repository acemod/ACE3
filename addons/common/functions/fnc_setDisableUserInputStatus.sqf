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


if (isnil QGVAR(DISABLE_USER_INPUT_COLLECTION_F)) then {
    GVAR(DISABLE_USER_INPUT_COLLECTION_F) = [];
};

if (_disable) then {
    GVAR(DISABLE_USER_INPUT_COLLECTION_F) pushback _id;
    [true] call FUNC(disableUserInput);
} else {
    GVAR(DISABLE_USER_INPUT_COLLECTION_F) = GVAR(DISABLE_USER_INPUT_COLLECTION_F) - [_id];
    if (GVAR(DISABLE_USER_INPUT_COLLECTION_F) isEqualTo []) then {
        [false] call FUNC(disableUserInput);
    };
};