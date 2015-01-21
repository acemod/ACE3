#include "script_component.hpp"

//player sideChat format["overcast: %1", overcast];
if(GVAR(rain_period_count) > GVAR(rain_next_period)) then {

	if(overcast >= 0.7) then {
		_lastRain = GVAR(current_rain);
		_rainOverCast = ((overcast-0.7)/0.3);
		GVAR(rain_next_period) = ceil((1+random(10))/GVAR(overcast_multiplier));

		GVAR(current_rain) = (GVAR(current_rain)+(((GVAR(current_rain)))*((_rainOverCast*(GVAR(overcast_multiplier)))/8)*GVAR(rain_current_range)));
		GVAR(current_rain) = (GVAR(current_rain) max 0.01) min 1;

		_transitionTime = (_rainOverCast*5)+(random (_rainOverCast*20))+1;
		GVAR(rain_current_range) = -1+(random 2);

		// player sideChat format["lastRain: %1 currentRain: %2", _lastRain, GVAR(current_rain)];
		// player sideChat format["_transitionTime: %1", _transitionTime];

		ACE_RAIN_PARAMS = [_lastRain, GVAR(current_rain), _transitionTime];
		//systemChat format ["ACE_RAIN_PARAMS_sent1: %1 %2 %3", ACE_RAIN_PARAMS];
	} else {
		GVAR(current_rain) = 0;
		_lastRain = GVAR(current_rain);
		_rainOverCast = 1;
		_transitionTime = (_rainOverCast*5)+(random (_rainOverCast*20))+1;

		ACE_RAIN_PARAMS = [_lastRain, GVAR(current_rain), _transitionTime];
		//systemChat format ["ACE_RAIN_PARAMS_sent2: %1 %2 %3", ACE_RAIN_PARAMS];
		TRACE_4("",_lastRain,_rainOverCast,_transitionTime, overcast);
	};


	GVAR(rain_period_start_time) = time;
	publicVariable "ACE_RAIN_PARAMS";
};

if(GVAR(wind_period_count) > GVAR(wind_next_period)) then {
	_startDir = GVAR(wind_current_dir);
	_startSpeed = GVAR(wind_current_speed);
	GVAR(wind_current_dir) = (GVAR(wind_current_dir)+(((GVAR(wind_current_dir)))*((overcast*(GVAR(overcast_multiplier)))/8)*GVAR(wind_current_range_dir)));

	GVAR(wind_current_speed) = (GVAR(wind_current_speed)+(((GVAR(wind_current_speed)))*(overcast*(GVAR(overcast_multiplier))/12)*GVAR(wind_current_range_speed)));
	GVAR(wind_current_speed) = GVAR(wind_current_speed) max 0.01;

	if(GVAR(wind_current_dir) < 0) then {
		GVAR(wind_current_dir) = GVAR(wind_current_dir)+360;
	};
	GVAR(wind_current_dir) = GVAR(wind_current_dir) % 360;

	GVAR(wind_current_range_speed) = (-1)+(random 2);

	GVAR(wind_current_range_dir) = (-1)+(random 2);

	GVAR(wind_next_period) = ceil((2+random(5))/(GVAR(overcast_multiplier)));
	GVAR(wind_period_count) = 0;

	_gustCount = floor(random(GVAR(wind_next_period)*(overcast*((GVAR(overcast_multiplier)^3)))));

	_time = GVAR(wind_next_period)*60;
	_gusts = [];
	if(_gustCount > 0) then {
		_maxInterval = _time/_gustCount;
		for "_i" from 0 to _gustCount-1 do {
			_gustTime = (random (3 min _maxInterval));
			_timeTillGust = (_maxInterval*_i)+(random (_maxInterval - _gustTime));
			_gustSpeed = (random 1);
			_gustDir = (GVAR(wind_current_dir)+(GVAR(wind_current_dir)*(-1+(random 2))))*(overcast*(GVAR(overcast_multiplier)));
			_gusts set[(count _gusts), [_timeTillGust, _gustTime, _gustSpeed, _gustDir]];
		};
	};
	// diag_log text "-------";
	// diag_log text format["startDir: %1 endDir: %2", _startDir, GVAR(wind_current_dir)];
	// diag_log text format["startSpeed: %1 endSpeed: %2", _startSpeed, GVAR(wind_current_speed)];
	// diag_log text format["GVAR(wind_current_range_speed): %1", GVAR(wind_current_range_speed)];
	// diag_log text format["GVAR(wind_current_range_dir): %1", GVAR(wind_current_range_dir)];
	// diag_log text format["gusts: %1", _gusts];
	// diag_log text format["next period: %1", GVAR(wind_next_period)];
	GVAR(wind_total_time) = GVAR(wind_total_time) + GVAR(wind_next_period);
	// diag_log text format["%1,%2,%3,%4", GVAR(wind_total_time), GVAR(wind_current_dir), GVAR(wind_current_speed), _gustCount];

	ACE_WIND_PARAMS = [_startDir, GVAR(wind_current_dir), _startSpeed, GVAR(wind_current_speed), _time, _gusts];

	GVAR(wind_period_start_time) = time;
	publicVariable "ACE_WIND_PARAMS";
};
GVAR(rain_period_count) = GVAR(rain_period_count) + 1;
GVAR(wind_period_count) = GVAR(wind_period_count) + 1;