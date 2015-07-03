#include "addon.hpp"
#include "main.hpp"

['GVAR(_OEF_renderer)', "onEachFrame", CFUNC(_OEF_renderer)] 
	call BIS_fnc_addStackedEventHandler;


// deleting figner-pointings which last more than FP_TIMEOUT

while {MAP_LEN(GVAR(cur_fps)) > 0} do
{
	if (!(
			alive player &&
			{player == vehicle player || 
			(vehicle player) isKindOf "StaticWeapon"}
		)) exitWith
	{
		GVAR(cur_fps) = CREATE_MAP();
	};
	
	
	_ct = diag_tickTime;
	
	_i = 0;
	while {_i < MAP_LEN(GVAR(cur_fps))} do
	{
		_e = MAP_VALUES(GVAR(cur_fps)) select _i;
		if (_ct > (_e select 2) + FP_TIMEOUT) then
		{
			MAP_IDEL(GVAR(cur_fps), _i);
		}
		else
		{
			_i = _i + 1;
		};
	};
	
	sleep 0.1;
};


['GVAR(_OEF_renderer)', "onEachFrame"] call BIS_fnc_addStackedEventHandler;

GVAR(fp_handler_running) = false;
