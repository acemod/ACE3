// by commy2
#include "script_component.hpp"

private ["_unit", "_anim", "_pos"];

_unit = _this select 0;
_anim = _this select 1;

_pos = _unit modelToWorld (_unit selectionPosition "camera");
[_unit, "AmovPknlMstpSnonWnonDnon", 2] call EFUNC(common,doAnimation);

_pos = _pos vectorDiff (_unit selectionPosition "camera");

_unit setPos _pos;
