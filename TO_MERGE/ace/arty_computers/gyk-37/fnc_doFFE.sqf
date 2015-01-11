//fnc_doFFE.sqf
#include "script_component.hpp"


[FFE_ID, true] call FUNC(switchMenu);

_missionData = GVAR(currentComputer) getVariable QGVAR(currentMission);
_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);

_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];

_moc = (([_missionData, IDC_Mission_ControlMethodOfControlSelect] call CBA_fnc_hashGet) select 2);


_roundCount = parseNumber ([_missionData, IDC_Mission_EngageRoundCountInput] call CBA_fnc_hashGet);
_ammoType = (([_missionData, IDC_Mission_EngageAmmunitionTypeSelect] call CBA_fnc_hashGet) select 2);
_fuze = (([_missionData, IDC_Mission_EngageFuzeTypeSelect] call CBA_fnc_hashGet) select 2);

_commands = [(_solutions select _solutionsIndex), _roundCount, _ammoType, _fuze, _moc] call FUNC(formatFireCommands);

GVAR(missionComputed) = true;
ctrlSetText [IDC_FFE_lowDisplay, (_commands select 0)];
ctrlSetText [IDC_FFE_MTODisplayLow, (_commands select 1)];



[] call FUNC(initFFE);