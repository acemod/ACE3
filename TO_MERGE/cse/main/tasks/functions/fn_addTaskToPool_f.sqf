/**
 * fn_addTaskToPool_f.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: [id STRING, args ARRAY, code COE]
 * @Return: nil;
 * @PublicAPI: false
 */

private ["_id", "_args","_code"];
_id = _this select 0;
_args = _this select 1;
_code = [_this, 2, {}, [{}]] call BIS_fnc_Param;

if (isnil "CSE_TASK_POOL_COLLECTION_F") then {
	CSE_TASK_POOL_COLLECTION_F = [];
};
CSE_TASK_POOL_COLLECTION_F pushback [_id, _args, _code ];

[format["Added task to task pool: %1", CSE_TASK_POOL_COLLECTION_F]] call cse_fnc_debug;
[[_id, _args, _code],"AddedTotaskPool"] call cse_fnc_customEventHandler_F;