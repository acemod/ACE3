#include "script_component.hpp"

_show   = _this select 0;
_saveState = false;
if((count _this) > 1) then {
	_saveState = _this select 1;
};
if(_saveState) then {
	_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls";

	switch(GVAR(currentScreen)) do {
		case MAIN_ID: {
			_controls = _controls >> "ace_arty_bcs_main";
		};
		case MISSION_ID: {
			_controls = _controls >> "ace_arty_bcs_mission";
		};
		case ADJUST_ID: {
			_controls = _controls >> "ace_arty_bcs_adjust";
		};
		case FFE_ID: {
			_controls = _controls >> "ace_arty_bcs_ffe";
		};
	};

	_controls = _controls >> "controls";


	GVAR(lastPage) = [] call CBA_fnc_hashCreate;
	[_controls,GVAR(lastPage)] call FUNC(loopSaveControls);
	GVAR(currentComputer) setVariable[QGVAR(lastPage), GVAR(lastPage), true];
};

_controls = [MAIN_ID, MISSION_ID, ADJUST_ID, FFE_ID];


{
    ctrlShow [_x, false];
} forEach(_controls);

ctrlShow [_show, true];

if(GVAR(currentScreen) != _show) then {
	GVAR(currentScreen) = _show;
	GVAR(currentComputer) setVariable[QGVAR(currentScreen), GVAR(currentScreen), true];
};