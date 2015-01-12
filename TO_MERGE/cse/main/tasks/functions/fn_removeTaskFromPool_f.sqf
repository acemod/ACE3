/**
 * fn_removeTaskFromPool_f.sqf
 * @Descr: Remove a task from the task pool.
 * @Author: Glowbal
 *
 * @Arguments: [id STRING]
 * @Return: nil
 * @PublicAPI: true
 */

private ["_id", "_index"];
_id = _this select 0;
_index = -1;

if (isnil "CSE_TASK_POOL_COLLECTION_F") exitwith {nil};

{
	if ((_x select 0) == _id) exitwith {
		_index = _foreachIndex;
		CSE_TASK_POOL_COLLECTION_F set [ _foreachIndex, objNull];
	};
}foreach CSE_TASK_POOL_COLLECTION_F;
CSE_TASK_POOL_COLLECTION_F = CSE_TASK_POOL_COLLECTION_F - [objNull];

nil;