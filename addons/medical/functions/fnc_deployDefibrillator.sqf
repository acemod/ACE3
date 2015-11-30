/*
 * Author: BaerMitUmlaut
 * Deploys a defibrillator from the inventory.
 *
 * Arguments:
 * 0: Caller <OBJECT>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
params ["_caller"];
private ["_defibrillator"];

_caller removeItem "ACE_defibrillator";
_defibrillator = "ACE_defibrillator_static" createVehicle [0,0,0];
_defibrillator setPosASL ((getPosASL _caller) vectorAdd (vectorDir _caller));
