/*
 * Author: BaerMitUmlaut
 * Handles treatment via surgical kit.
 *
 * Public: No
 */

#include "script_component.hpp"

private ["_target", "_caller", "_selectionName", "_className", "_items"];
_caller = _this select 0;
_target = _this select 1;
_selectionName = _this select 2;
_className = _this select 3;
_items = _this select 4;

// TODO replace by event system
[[_caller, _target], QUOTE(DFUNC(treatmentAdvanced_surgicalKitLocal)), _target] call EFUNC(common,execRemoteFnc); /* TODO Replace by event system */

true;
