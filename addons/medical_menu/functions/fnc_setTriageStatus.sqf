/*
 * Author: Glowbal
 * Set the triage status of object
 *
 * Arguments:
 * 0: Target <OBJECT>
 * 1: Status <NUMBER>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_status"];

_target setvariable [QEGVAR(medical,triageLevel), _status, true];
