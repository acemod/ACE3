/**
 * fnc_onStartMovingUnit.sqf
 * @Descr: is called when a unit start to move another unit through either carry or drag actions.
 *
 * @Author: Glowbal
 *
 * @Arguments: [caller OBJECT, unit OBJECT, killOnDrop BOOL (Should the unit be killed when being dropped), dragging BOOL (true means the dragging animations should be played, false will play carry animations)]
 * @Return: nil
 * @PublicAPI: false
 */

#include "script_component.hpp"


private ["_caller","_target","_killOnDrop","_dragging"];
_caller = _this select 0;
_target = _this select 1;
_killOnDrop = _this select 2;
_dragging = _this select 3;

_caller setvariable[QGVAR(onStartMovingUnitParams), [_caller, _target, _killOnDrop, _dragging]];

[_target, true] call EFUNC(common,disableAI_f);

nil;