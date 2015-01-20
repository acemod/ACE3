#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

PREP(bulletflight);
PREP(fired_man);
PREP(clockwind);
PREP(wind_intuitive);
PREP(keypressed);

GVAR(running) = false;
					// Settings for MP missions. in SP clientside config takes priority
GVAR(force_drift_on) = true;	//true: drift always on, don't allow client to turn it off
					//false: client setting will determine whether he has drift
GVAR(force_drift_off) = false;  //true: drift always off, don't allow client to turn it on
					//false: client setting will determine whether he has drift

GVAR(presstime) = 0;
FUNC(KEEPTIME) = {
	if((count GVAR(WINDSPEED)) > 0) then {
		private ["_wind", "_p", "_str"];
		_wind = ACE_wind;
		
		_p = _wind call CBA_fnc_vect2polar;
		_str = format["Wind: %1 at %2m/s (%3MPH)\n%4", floor(_p select 1), floor(_p select 0), floor((_p select 0)*2.23693629), GVAR(WINDSPEED)];
		TRACE_2("Wind",_wind,_str);
	};
};

[QUOTE(ADDON), "Toggle_Wind_Info", { [_this] call FUNC(keypressed) }] call CBA_fnc_addKeyHandlerFromConfig; // sys_eject: Uses same keypress to show Altimeter while in a parachute or skydiving


#ifdef DEBUG_MODE_FULL
	[FUNC(KEEPTIME), 0.0, []] call CBA_fnc_addPerFrameHandler;
#endif
