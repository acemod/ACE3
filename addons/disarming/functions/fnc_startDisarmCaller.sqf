/*
 * Author: PabstMirror
 * Starts the disarming process from the caller
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 2: type of disarm <STRING>
 *
 * Return Value:
 * None
 *
 * Example:
 * TODO
 *
 * Public: No
 */
#include "script_component.hpp"

PARAMS_3(_caller,_target,_type);

["Disarm", [_target], [_caller,_target,_type]] call EFUNC(common,targetEvent);
