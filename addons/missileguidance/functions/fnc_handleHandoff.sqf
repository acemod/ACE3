/*
 * Author: ACE
 * Not currently used
 *
 * Arguments:
 * 0: TARGET <OBJECT>
 * 1: ARGS <ARRAY>
 *
 * Return Value:
 * <BOOLEAN>
 *
 * Public: No
 */

#include "script_component.hpp"
PARAMS_2(_target,_args);

if (isNil "_target" || {isNull _target} || {!local _target} ) exitWith { false };

[FUNC(guidancePFH), 0, _args] call CBA_fnc_addPerFrameHandler;
