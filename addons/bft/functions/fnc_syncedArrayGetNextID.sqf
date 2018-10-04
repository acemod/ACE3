#include "script_component.hpp"
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


params ["_varName"];

private _variable = missionNamespace getvariable [_varName, []];
private _nextID = 0;

if !(_variable isEqualTo []) then {
    _nextID = ((_variable select (count _variable - 1)) select 0) + 1;
};

_nextID
