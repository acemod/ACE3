/*
 * Author: joko // Jonas
 * Hides the height and velocity display while freefalling or parachuting on higher difficulties.
 *
 * Arguments:
 * 0: Execed Unit As Object
 * 1: Target As Object
 * 2:
 *
 * Return Value:
 * Nothing
 *
 * Public: No
 */
 #include "script_component.hpp"

private ["_unit","_target","_kindOf"];

_unit = _this select 0;
_target = _this select 1;
_kindOf = _this select 2;

_target setVariable [QGVAR(OriginalHeadGear),headgear _target,true];
_target setVariable [QGVAR(wearHeadBag),true,true];
removeHeadgear _target;
_unit removeItem _kindOf;
_target addHeadgear _kindOf;

[[1,_kindOf],QFUNC(wearHeadBag),_target] call EFUNC(common,execRemoteFnc);
