#include "script_component.hpp"


FUNC(KEEPTIME) = {
	if((count GVAR(WINDSPEED)) > 0) then {
		private ["_wind", "_p", "_str"];
		_wind = ACE_wind;

		_p = _wind call CBA_fnc_vect2polar;
		_str = format["Wind: %1 at %2m/s (%3MPH)\n%4", floor(_p select 1), floor(_p select 0), floor((_p select 0)*2.23693629), GVAR(WINDSPEED)];
		TRACE_2("Wind",_wind,_str);
	};
};

#ifdef DEBUG_MODE_FULL
	[FUNC(KEEPTIME), 0.0, []] call CBA_fnc_addPerFrameHandler;
#endif
