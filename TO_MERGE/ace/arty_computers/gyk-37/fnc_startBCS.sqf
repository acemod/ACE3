//fnc_startBCS.sqf
#include "script_component.hpp"
disableSerialization;

PARAMS_1(_computer);
GVAR(currentComputer) = _computer;

_currentUser = GVAR(currentComputer) getVariable [QGVAR(currentUser), GVAR(currentComputer)];
if(_currentUser == GVAR(currentComputer) || _currentUser == player) then {
	createDialog "ace_arty_bcs_Display";
	if(_currentUser == GVAR(currentComputer)) then {
		GVAR(currentComputer) setVariable [QGVAR(currentUser), player, true];
	};
} else {
	if(!(alive _currentUser) || !(_currentUser in GVAR(currentComputer))) then {
		createDialog "ace_arty_bcs_Display";
		GVAR(currentComputer) setVariable [QGVAR(currentUser), player, true];
	} else {
		hint format["BCS is currently in use by: %1", _currentUser];
	};
};


