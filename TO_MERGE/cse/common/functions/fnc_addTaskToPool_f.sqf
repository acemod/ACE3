/**
 * fn_addTaskToPool_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: [id STRING, args ARRAY, code COE]
 * @Return: nil;
 * @PublicAPI: false
 */
#include "script_component.hpp"

private ["_id", "_args","_code"];
_id = _this select 0;
_args = _this select 1;
_code = [_this, 2, {}, [{}]] call BIS_fnc_Param;

if (isnil QGVAR(TASK_POOL_COLLECTION)) then {
	GVAR(TASK_POOL_COLLECTION) = [];
};
GVAR(TASK_POOL_COLLECTION) pushback [_id, _args, _code ];

[format["Added task to task pool: %1", GVAR(TASK_POOL_COLLECTION)]] call FUNC(debug);
[[_id, _args, _code],"AddedTotaskPool"] call FUNC(customEventHandler_F);