//fnc_adjustBack.sqf
#include "script_component.hpp"
[MISSION_ID] call FUNC(switchMenu);
_missionType = GVAR(currentComputer) getVariable QGVAR(currentMissionType);
(_missionType select 0) call FUNC(initMissionScreen);
_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_mission" >> "controls";
[_controls, GVAR(lastPage)] call FUNC(loopRestoreControls);