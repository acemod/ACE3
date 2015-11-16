/*
 * Author: BaerMitUmlaut
 * Checks if a unit can use a defibrillator.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 * 1: Target <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_caller", "_target"];
private ["_defibrillator"];

_defibrillator = nearestObject [_caller, "ACE_defibrillator_static"];

!(isNull _defibrillator || {(_defibrillator distance _target) > 5} || {((getObjectTextures _defibrillator) select 0) != "#(rgb,8,8,3)color(0.4,0,0,1)"})
