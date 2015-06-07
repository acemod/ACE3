#include "addon.hpp"
#include "main.hpp"

// finger-pointing array format:
//   1: source player
//   2: position of finger-pointing
//   3: players to broadcast the finger-pointing to

// server-side event-handlers
	
if (isServer) then
{
	// receives finger-pointing array and broadcasts it to provided players
	
	GVAR(fnc_pv_fpToServer) = 
	{
		LOGV(_this);

		PV(_val) = _this select 1;
		
		PV(_sp) = _val select 0;
		PV(_pfp) = _val select 1;
		PV(_dps) = _val select 2;
		
		GVAR(pv_fpToClient) = [_sp, _pfp];
		PV(_owner) = 0;
		{
			_owner = owner _x;
			
			LOGV(_x);
			LOGV(_owner);
			
			if (_owner > 0 && {isPlayer _x}) then
			{
				if (player == _x) then
				{
					[0, GVAR(pv_fpToClient)] call GVAR(fnc_pv_fpToClient);
				}
				else
				{
					_owner publicVariableClient 'GVAR(pv_fpToClient)';
				};
			};			
		} forEach _dps;
		
	};
		
	
	
	'GVAR(pv_fpToServer)' addPublicVariableEventHandler GVAR(fnc_pv_fpToServer);
	
};


if (hasInterface) then
{
	// currently shown finger-pointings map
	//   key: source player
	//   value: [position, source player name, last update time]
	//
	
	
	GVAR(cur_fps) = CREATE_MAP();
	
	GVAR(fp_handler_running) = false;
	
	
	// receives pointing-object and starts drawing process in format
	//   1: source player
	//   2: position of finger-pointing
	//  
	
	GVAR(fnc_pv_fpToClient) = {
		LOGV(_this);
		
		PV(_val) = _this select 1;
		PV(_sp) = _val select 0;
		PV(_pfp) = _val select 1;
		
		PV(_newval) = [_pfp, name _sp, diag_tickTime];
		MAP_SET(GVAR(cur_fps), _sp, _newval);
		
		if (!GVAR(fp_handler_running)) then
		{
			GVAR(fp_handler_running) = true;
			
			[] spawn CFUNC(_fp_handler);
		};
	};
	
	'GVAR(pv_fpToClient)' addPublicVariableEventHandler GVAR(fnc_pv_fpToClient);
	
	
};
