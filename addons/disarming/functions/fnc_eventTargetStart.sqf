/*
 * Author: PabstMirror
 * TODO
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: type of disarm <STRING>
 *
 * Return Value:
 * Nothing
 *
 * Example:
 * finishDisarmTarget
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_caller,_target,_listOfObjectsToRemove);

[_caller, _target, _listOfObjectsToRemove] call FUNC(disarmDropItems);
