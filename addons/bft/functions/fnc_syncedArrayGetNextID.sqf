/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: varName <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

PARAMS_1(_varName);

private ["_variable", "_nextID"];
_variable = missionNamespace getvariable [_varName, []];
_nextID = 0;

if (count _variable > 0) then {
    _nextID = ((_variable select (count _variable - 1)) select 0) + 1;
};

_nextID
