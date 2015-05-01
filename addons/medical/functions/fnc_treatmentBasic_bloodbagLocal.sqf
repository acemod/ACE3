/*
 * Author: KoffeinFlummi
 * Local callback when the bloodbag treatment is complete
 *
 * Arguments:
 * 0: The patient <OBJECT>
 *
 * Return Value:
 * nil
 *
 * Public: No
 */

#include "script_component.hpp"
#define BLOODBAGHEAL 70

private ["_target","_blood"];
_target = _this select 0;

_blood = ((_target getVariable [QGVAR(bloodVolume), 100]) + BLOODBAGHEAL) min 100;
_target setVariable [QGVAR(bloodVolume), _blood, true];
