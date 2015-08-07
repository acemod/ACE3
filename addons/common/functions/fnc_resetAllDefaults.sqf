/*
 * Author: Glowbal
 *
 * reset all variables that have been defined
 *
 * Argument:
 * ?
 *
 * Return value:
 * ?
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_unit"];

_unit setvariable ["ACE_isDead",nil,true];
_unit setvariable ["ACE_isUnconscious", nil, true];

if (isPlayer _unit) then {
    [true] call FUNC(setVolume);
    [false] call FUNC(disableKeyInput);
    if (["ace_medical"] call FUNC(isModLoader)) then {
        [false] call EFUNC(medical,effectBlackOut);
    };

    if !(isnil QGVAR(DISABLE_USER_INPUT_COLLECTION)) then {
        // clear all disable user input
        {
            [_x, false] call FUNC(setDisableUserInputStatus);
            true
        } count GVAR(DISABLE_USER_INPUT_COLLECTION);
    };
};

{
    _x params ["_name", "", "", "_public", "_var"];
    if (!_var) then {
        _unit setvariable [_name, nil, _public];
    };
    true
} count ([_unit] call FUNC(getAllDefinedSetVariables));

_unit setVariable ["ACE_forceWalkStatusNumber", 0, true];
