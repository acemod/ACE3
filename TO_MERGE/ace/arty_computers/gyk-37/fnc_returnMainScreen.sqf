#include "script_component.hpp"


[MAIN_ID] call FUNC(switchMenu);
GVAR(missionComputed) = false;
[] call FUNC(initMainScreen);
_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_main" >> "controls";
_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);
[_controls, _batteryData] call FUNC(loopRestoreControls);