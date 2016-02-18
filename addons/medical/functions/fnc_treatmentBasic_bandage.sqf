/*
 * Author: KoffeinFlummi
 * Callback when the bandaging treatment is complete
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
#define BANDAGEHEAL 0.8

private ["_hitSelections", "_hitPoints", "_point", "_damage"];
params ["_caller", "_target", "_selection", "_className"];

if (local _target) then {
    ["treatmentBasic_bandageLocal", [_target, _selection]] call EFUNC(common,localEvent);
} else {
    ["treatmentBasic_bandageLocal", _target, [_target, _selection]] call EFUNC(common,targetEvent);
};
