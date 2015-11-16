/*
 * Author: BaerMitUmlaut
 * Treatment with defibrillator.
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_caller", "_target"];

["medical_defibrillatorLocal", [_target], [_caller, _target]] call EFUNC(common,targetEvent);
