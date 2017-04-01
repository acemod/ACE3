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

_target setVariable [QEGVAR(medical,triageLevel), _status, true];
