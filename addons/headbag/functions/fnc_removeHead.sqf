/*
 * Author: joko // Jonas
 * Hides the height and velocity display while freefalling or parachuting on higher difficulties.
 *
 * Arguments:
 * 0: 
 * 1:
 *
 * Return Value:
 * None
 *
 * Public: No
 */

#include "script_component.hpp"
private ["_unit","_target","_kindOf","_storedHelmet"];
_unit = _this select 0;
_target = _this select 1;
_kindOf = headgear _target;
_storedHelmet = _target getVariable [QGVAR(OriginalHeadGear),headgear _target];
_target setVariable [QGVAR(wearHeadBag),false,true];
removeHeadgear _target;
_target addHeadgear _storedHelmet;
_unit addItem _kindOf;
[[0,_kindOf],QFUNC(wearHeadBag),_target] call EFUNC(common,execRemoteFnc);
