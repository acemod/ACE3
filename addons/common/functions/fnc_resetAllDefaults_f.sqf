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

private ["_unit","_oldUnit","_sets"];
_unit = _this select 0;

_unit setvariable [QGVAR(isDead),nil,true];
_unit setvariable ["ACE_isUnconscious", nil, true];

if (isPlayer _unit) then {
    [true] call FUNC(setVolume_f);
    [false] call FUNC(disableKeyInput_f);
    [false] call EFUNC(GUI,effectBlackOut);

    if !(isnil QGVAR(DISABLE_USER_INPUT_COLLECTION_F)) then {
        // clear all disable user input
        {
            [_X, false] call FUNC(setDisableUserInputStatus);
        }foreach GVAR(DISABLE_USER_INPUT_COLLECTION_F);
    };
};

{
    if (!(_x select 4)) then {
        _unit setvariable [(_x select 0),nil,_x select 3];
    };
}foreach ([_unit] call FUNC(getAllDefinedSetVariables));

[[_unit],"resetToDefaults"] call FUNC(raiseScriptedEvent_f);