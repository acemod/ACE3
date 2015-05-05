/*
 * Author: Glowbal
 *
 *
 * Arguments:
 * 0: Unit <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_varName", "_variable", "_nextID"];
_varName = _this select 0;

_variable = missionNamespace getvariable [_varName, []];
_nextID = 0;

if (count _variable > 0) then {
    _nextID = ((_variable select (count _variable - 1)) select 0) + 1;
};
_nextID;
