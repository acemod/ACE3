// by commy2
#include "\z\ace\addons\common\script_component.hpp"

private ["_unit", "_target", "_owner"];

_unit = _this select 0;
_target = _this select 1;

_owner = _target getVariable ["ACE_isUsedBy", objNull];

isNull _owner || {_unit == _owner} || {!isPlayer _owner}
