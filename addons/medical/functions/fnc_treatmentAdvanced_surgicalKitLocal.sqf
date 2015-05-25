/*
 * Author: BaerMitUmlaut
 * Handles treatment via surgical kit (locally).
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_caller"];
_caller = _this select 0;
_target = _this select 1;

if (alive _target) exitwith {

    _target setvariable [QGVAR(bandagedWounds), [], true];

};
