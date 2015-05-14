/**
 * fn_resetAllDefaults_f.sqf
 * @Descr: reset all variables that have been defined
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

PARAMS_1(_unit);

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
        }foreach GVAR(DISABLE_USER_INPUT_COLLECTION);
    };
};

{
    if (!(_x select 4)) then {
        _unit setvariable [(_x select 0),nil,_x select 3];
    };
} forEach ([_unit] call FUNC(getAllDefinedSetVariables));

_unit setVariable ["ACE_forceWalkStatusNumber", 0, true];
