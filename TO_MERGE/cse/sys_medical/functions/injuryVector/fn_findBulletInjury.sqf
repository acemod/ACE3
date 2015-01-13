#include "cse\cse_sys_medical\injuryTypes.h"
#include "cse\cse_sys_medical\bodyParts.h"

private ["_bodyPart","_damage","_injuryTypeReturn"];
_bodyPart = _this select 0;
_damage = _this select 1;
_distance = _this select 2;

_injuryTypeReturn = [];
if (_damage >0.2) then {
	switch (_bodyPart) do {
		case HEAD: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, LARGE_GSW];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_GSW];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_GSW];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_BURN];
						_injuryTypeReturn set [count _injuryTypeReturn, GRAZE_WOUND];
					};
				};
			};
		};
		case TORSO: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, LARGE_GSW];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_GSW];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_GSW];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_BURN];
						_injuryTypeReturn set [count _injuryTypeReturn, GRAZE_WOUND];
					};
				};
			};
		};
		case ARM_R: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, LARGE_GSW];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_GSW];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_GSW];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_BURN];
						_injuryTypeReturn set [count _injuryTypeReturn, GRAZE_WOUND];
					};
				};
			};
		};
		case ARM_L: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, LARGE_GSW];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_GSW];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_GSW];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_BURN];
						_injuryTypeReturn set [count _injuryTypeReturn, GRAZE_WOUND];
					};
				};
			};
		};
		case LEG_R: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, LARGE_GSW];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_GSW];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_GSW];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_BURN];
						_injuryTypeReturn set [count _injuryTypeReturn, GRAZE_WOUND];
					};
				};
			};
		};
		case LEG_L: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, LARGE_GSW];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_GSW];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_GSW];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_BURN];
						_injuryTypeReturn set [count _injuryTypeReturn, GRAZE_WOUND];
					};
				};
			};
		};
		default {};
	};
} else {
	if (_damage >0.01) then {
		_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
		if (random(1)>0.5) then {
			_injuryTypeReturn set [count _injuryTypeReturn, MINOR_BURN];
		};
	};
};

_injuryTypeReturn