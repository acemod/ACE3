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
				_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_OPEN_WOUND];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MINOR_OPEN_WOUND];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_CUT];
					};
				};
			};
		};
		case TORSO: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_OPEN_WOUND];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MINOR_OPEN_WOUND];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_CUT];
					};
				};
			};
		};
		case ARM_R: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_OPEN_WOUND];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MINOR_OPEN_WOUND];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_CUT];
					};
				};
			};
		};
		case ARM_L: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_OPEN_WOUND];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MINOR_OPEN_WOUND];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_CUT];
					};
				};
			};
		};
		case LEG_R: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_OPEN_WOUND];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MINOR_OPEN_WOUND];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_CUT];
					};
				};
			};
		};
		case LEG_L: {
			if (_damage > 0.4) then {
				_injuryTypeReturn set [count _injuryTypeReturn, MEDIUM_OPEN_WOUND];
			} else {
				if (random(1)>0.5) then {
					_injuryTypeReturn set [count _injuryTypeReturn, MINOR_OPEN_WOUND];
				} else {
					if (random(1)>0.5) then {
						_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
					} else {
						_injuryTypeReturn set [count _injuryTypeReturn, MINOR_CUT];
					};
				};
			};
		};
		default {};
	};
} else {
	if (_damage >0.01) then {
		if (random(1)>0.5) then {
			_injuryTypeReturn set [count _injuryTypeReturn, SCRATCH];
		};
	};
};

_injuryTypeReturn