/*
 * Author: KoffeinFlummi
 * Callback when the morphine treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Body part <STRING>
 * 3: Treatment class name <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */
#include "script_component.hpp"

#define MORPHINEHEAL 0.4

params ["_caller", "_target"];

[QGVAR(treatmentMorphineLocal), [_target], _target] call CBA_fnc_targetEvent;
