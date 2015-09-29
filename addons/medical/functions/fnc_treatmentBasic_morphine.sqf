/*
 * Author: KoffeinFlummi
 * Callback when the morphine treatment is complete
 *
 * Arguments:
 * 0: The medic <OBJECT>
 * 1: The patient <OBJECT>
 * 2: Selection Name <STRING>
 * 3: Treatment classname <STRING>
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
#define MORPHINEHEAL 0.4

params ["_caller", "_target"];

[[_target], QUOTE(DFUNC(treatmentBasic_morphineLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */
