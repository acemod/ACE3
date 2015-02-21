#include "script_component.hpp"

PARAMS_2(_unit,_target);

(alive _target) && 
{[_target] call EFUNC(common,isPlayer)} &&
{(_target getVariable [QGVAR(sharingMapHost), objNull]) == _target} && 
{(_target == (vehicle _target)) || {(vehicle _target) == (vehicle _unit)}
