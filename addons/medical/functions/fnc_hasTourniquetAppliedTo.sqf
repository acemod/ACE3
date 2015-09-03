/*
 * Author: Glowbal
 * Check if unit has a tourniquet applied to the specified bodypart
 *
 * Arguments:
 * 0: The Unit <OBJECT>
 * 1: SelectionName <STRING>
 *
 * ReturnValue:
 * Has tourniquet applied <BOOL>
 *
 * Public: Yes
 */

#include "script_component.hpp"

private ["_target", "_selectionName"];
_target = _this select 0;
_selectionName = _this select 1;

(((_target getvariable [QGVAR(tourniquets), [0,0,0,0,0,0]]) select ([_selectionName] call FUNC(selectionNameToNumber))) > 0);
