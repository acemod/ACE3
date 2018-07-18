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
 * Example:
 * [bob, 2] call ACE_medical_menu_fnc_setTriageStatus
 *
 * Public: No
 */
#include "script_component.hpp"

params ["_target", "_status"];

_target setVariable [QEGVAR(medical,triageLevel), _status, true];
