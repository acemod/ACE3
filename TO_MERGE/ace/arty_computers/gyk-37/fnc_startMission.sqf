#include "script_component.hpp"

// Do battery check
_missionType = _this select 0;
_adjust = _this select 1;
_batteryData = [] call CBA_fnc_hashCreate;
_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_main" >> "controls";
_valid = [_controls, _batteryData] call FUNC(validateData);
GVAR(currentOT) = "";
if(_valid) then {
	_okTypes = ["grid", "polar", "shift"]; // only supported types for right now, immediates/repeat will come sooon!!!
	if(_missionType in _okTypes) then {
		GVAR(currentComputer) setVariable [QGVAR(batteryData), _batteryData, true];
		GVAR(currentComputer) setVariable [QGVAR(currentMissionType), _this, true];
		(configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_mission" >> "controls") call FUNC(loopResetControls);
		[MISSION_ID] call FUNC(switchMenu);
		
		
		_missionType call FUNC(initMissionScreen);
	} else {
		BCSERROR("Current mission type is not supported in this version of the software.");
	};
};
