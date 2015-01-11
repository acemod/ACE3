//fnc_bcsUnload.sqf
#include "script_component.hpp"


PREP(bcsLoad);


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


GVAR(currentState) = [] call CBA_fnc_hashCreate;


[_controls] call FUNC(loopSaveControls);
if(!GVAR(openingMap)) then {
	GVAR(currentComputer) setVariable [QGVAR(currentState), GVAR(currentState), true];
	GVAR(currentComputer) setVariable [QGVAR(currentUser), GVAR(currentComputer), true];
} else {
	GVAR(currentComputer) setVariable [QGVAR(currentState), GVAR(currentState)];
};
GVAR(currentComputer) = nil;