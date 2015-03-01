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
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"
#define MORPHINEHEAL 0.4

private ["_caller", "_target","_className","_blood","_morphine","_pain"];
_caller = _this select 0;
_target = _this select 1;
_className = _this select 3;

// reduce pain, pain sensitivity
_morphine = (_target getVariable [QGVAR(morphine), 0] + MORPHINEHEAL) min 1;
_target setVariable [QGVAR(morphine), _morphine, true];
_pain = ((_target getVariable [QGVAR(pain), 0]) - MORPHINEHEAL) max 0;
_target setVariable [QGVAR(pain), _pain, true];

// @todo overdose

// @todo pain, painkiller reduction
