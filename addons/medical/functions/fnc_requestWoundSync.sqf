/*
 * Author: Glowbal
 * Ask for the latest wound information.
 *
 * Arguments:
 * 0: The target <OBJECT>
 * 1: object belonging to the caller <OBJECT>
 *
 * ReturnValue:
 * <NIL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private [ "_target", "_caller"];
_target = _this select 0;
_caller = _this select 1;

if (local _target || GVAR(level) < 2) exitwith {}; // if the target is local, we already got the most update to date information
if (_target getvariable [QGVAR(isWoundSynced), false]) exitwith {};
_target setvariable [QGVAR(isWoundSynced), true];
["medical_woundUpdateRequest", [_target], [_target, _caller]] call EFUNC(common,targetEvent);
