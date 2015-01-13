/**
 * fn_loopThroughPool_f.sqf
 * @Descr:
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */
#include "script_component.hpp"

#define TASK_PARAMETERS (_x select 1)
#define TASK_CODE 		(_x select 2)

{
	TASK_PARAMETERS call TASK_CODE;
	false;
}count GVAR(TASK_POOL_COLLECTION);
