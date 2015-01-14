/**
 * fn_updateActivityLog_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#include "script_component.hpp"

[] spawn {
	_log = [GVAR(INTERACTION_TARGET)] call FUNC(getActivityLog_CMS);
	_counter = 0;
	lbclear 214;
	{
		//[_caller,_moment,_activity,_type]
		lbadd[214, _x select 1]; // moment
		lbadd[214, _x select 0]; // name, caller
		//lbadd[214, _x select 2]; // activity
		lbSetData [214,_counter,_x select 2];

		_counter = _counter + 1;
	}foreach _log;
	if (count _log < 1) then {
		lbadd[214, "No Activity recorded.."];
		lbadd[214, ""];
	};

	_log = [GVAR(INTERACTION_TARGET)] call FUNC(getQuickViewLog_CMS);
	_counter = 0;
	lbclear 215;
	{

		//[_caller,_moment,_activity,_type]
		lbadd[215, _x select 1]; // moment
		lbadd[215, _x select 0]; // name, caller
		lbSetData [215,_counter,_x select 2];
		_counter = _counter + 1;
	}foreach _log;
	if (count _log < 1) then {
		lbadd[215, "No Data recorded.."];
		lbadd[215, ""];
	};

};