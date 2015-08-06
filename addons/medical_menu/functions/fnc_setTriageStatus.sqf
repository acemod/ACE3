/*
 * Author: Glowbal
 * Set the triage status of object
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Status <NUMBER>
 *
 * Return Value:
 * NONE
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_status"];
_target = _this select 0;
_status = _this select 1;

_target setvariable [QEGVAR(medical,triageLevel), _status, true];
