//fnc_m137_keyDown.sqf
#include "script_component.hpp"
PARAMS_4(_ctrl,_code,_shift,_ctrl);
if(_code == 42) then {
	GVAR(m137_shift) = true;
};
if(_code == 29) then {
	GVAR(m137_ctrl) = true;
};
if(_code == 203) then {
	if(_shift) then {
		if(_ctrl) then {
			[-0.25] call FUNC(adjustTraverse);
		} else {
			[-10] call FUNC(adjustTraverse);
		};
	} else {
		[-1] call FUNC(adjustTraverse);
	};
};
if(_code == 205) then {
	if(_shift) then {
		if(_ctrl) then {
			[0.25] call FUNC(adjustTraverse);
		} else {
			[10] call FUNC(adjustTraverse);
		};
	} else {
		[1] call FUNC(adjustTraverse);
	};
};
if(_code == 200) then {
	if(_shift) then {
		[-10] call FUNC(adjustElevation);
	} else {
		[-1] call FUNC(adjustElevation);
	};
};
if(_code == 208) then {
	if(_shift) then {
		[10] call FUNC(adjustElevation);
	} else {
		[1] call FUNC(adjustElevation)
	};
};
false