/**
 * fn_removeTaskFromPool_f.sqf
 * @Descr: Remove a task from the task pool.
 * @Author: Glowbal
 *
 * @Arguments: [id STRING]
 * @Return: nil
 * @PublicAPI: true
 */

#include "script_component.hpp"

private ["_id", "_index"];
_id = _this select 0;
_index = -1;

if (isnil QGVAR(TASK_POOL_COLLECTION)) exitwith {nil};

{
	if ((_x select 0) == _id) exitwith {
		_index = _foreachIndex;
		GVAR(TASK_POOL_COLLECTION) set [ _foreachIndex, objNull];
	};
}foreach GVAR(TASK_POOL_COLLECTION);
GVAR(TASK_POOL_COLLECTION) = GVAR(TASK_POOL_COLLECTION) - [objNull];

nil;