//fnc_doAdjustment.sqf

#include "script_component.hpp"


[ADJUST_ID] call FUNC(switchMenu);
(configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_adjust" >> "controls") call FUNC(loopResetControls);
GVAR(adjustCount) = GVAR(adjustCount) + 1;
GVAR(currentComputer) setVariable[QGVAR(adjustCount), GVAR(adjustCount), true];

_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];

_missionData = GVAR(currentComputer) getVariable QGVAR(currentMission);
_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);


_moc = (([_missionData, IDC_Mission_ControlMethodOfControlSelect] call CBA_fnc_hashGet) select 2);


_roundCount = parseNumber ([_missionData, IDC_Mission_EngageRoundCountInput] call CBA_fnc_hashGet);
_ammoType = (([_missionData, IDC_Mission_EngageAmmunitionTypeSelect] call CBA_fnc_hashGet) select 2);
_fuze = (([_missionData, IDC_Mission_EngageFuzeTypeSelect] call CBA_fnc_hashGet) select 2);


_commands = [(_solutions select _solutionsIndex), _roundCount, _ammoType, _fuze, _moc, true] call FUNC(formatFireCommands);

GVAR(missionComputed) = true;
ctrlSetText [IDC_Adjust_lowDisplay, (_commands select 0)];
ctrlSetText [IDC_Adjust_MTODisplayLow, (_commands select 1)];
ctrlSetText [IDC_Adjust_AdjustOTDirInput, (format["%1", GVAR(currentOT)])];


[] call FUNC(initAdjust);