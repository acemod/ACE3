/*
 * Author: PabstMirror
 * TODO
 *
 * Arguments:
 * 0: caller (player) <OBJECT>
 * 1: target <OBJECT>
 * 1: type of disarm <STRING>
 *
 * Return Value:
 * The return value <BOOL>
 *
 * Example:
 * finishDisarmTarget
 *
 * Public: No
 */
#include "script_component.hpp"


PARAMS_3(_caller,_target,_errorMsg);

systemChat format ["Debug-Target: Disarm finished with code [%1]", _errorMsg];

["DisarmFinished", [_caller], [_caller, _target, _errorMsg]] call EFUNC(common,targetEvent);
