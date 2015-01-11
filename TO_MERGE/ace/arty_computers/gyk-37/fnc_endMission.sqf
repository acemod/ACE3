//fnc_endMission.sqf
#include "script_component.hpp"

_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];
_missionData = GVAR(currentComputer) getVariable QGVAR(currentMission);
_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);
_adjustments = GVAR(currentComputer) getVariable [QGVAR(currentAdjustments), []];
_missionNames = GVAR(currentComputer) getVariable [QGVAR(missionNames), []];



_targetNumber = parseNumber ([_batteryData, IDC_Main_TargetNumStart] call CBA_fnc_hashGet);
_targetNumber = _targetNumber + GVAR(missionCount);
_targetNumberText = (str _targetNumber);
if(_targetNumber < 1000) then {
	_targetNumberText = "0" + _targetNumberText;
};
if(_targetNumber < 100) then {
	_targetNumberText = "0" + _targetNumberText;
};
if(_targetNumber < 10) then {
	_targetNumberText = "0" + _targetNumberText;
};
_targetPrefix = ([_batteryData, IDC_Main_TargetPrefix] call CBA_fnc_hashGet);

_targetName = format["%1%2", (toUpper _targetPrefix), _targetNumberText];

_bda = ctrlText IDC_FFE_BDAInput;
_notes = ctrlText IDC_Mission_EngageNotesInput;

_eom =
	[
		_targetName,
		_solutions,
		_missionData,
		_batteryData,
		_adjustments,
		_bda,
		_notes
	];


_ne = (_solutions select _solutionsIndex) select 2;

_easting = floor(_ne select 0);
_eastingStr = str (_easting);
if(_easting < 10000) then {
	_eastingStr = "0" + _eastingStr;
};
if(_easting < 1000) then {
	_eastingStr = "0" + _eastingStr;
};
if(_easting < 100) then {
	_eastingStr = "0" + _eastingStr;
};
if(_easting < 10) then {
	_eastingStr = "0" + _eastingStr;
};

_northing = floor(_ne select 1);
_northingStr = str (_northing);
if(_northing < 10000) then {
	_northingStr = "0" + _northingStr;
};
if(_northing < 1000) then {
	_northingStr = "0" + _northingStr;
};
if(_northing < 100) then {
	_northingStr = "0" + _northingStr;
};
if(_northing < 10) then {
	_northingStr = "0" + _northingStr;
};

_grid = _eastingStr + _northingStr;
_alt = (str (_ne select 2));
_knownPoints = GVAR(currentComputer) getVariable [QGVAR(knownPoints), []];
_knownPoints set[(count _knownPoints), [_targetName,_grid,_alt]];
GVAR(currentComputer) setVariable [QGVAR(knownPoints), _knownPoints, true];
	
_storeName = format["ACEARTY%1%2_%3", (floor diag_tickTime), (floor (random 1000)), _targetName];

_missionNames set[(count _missionNames), _storeName];
GVAR(currentComputer) setVariable [_storeName, _eom, true];


_logMsg = format["EOM WROTE MISSION %1 TO COMPUTER", _targetName];


[MAIN_ID] call FUNC(switchMenu);
GVAR(missionComputed) = false;
GVAR(missionCount) = GVAR(missionCount) + 1;
GVAR(currentComputer) setVariable[QGVAR(missionCount), GVAR(missionCount)];
[] call FUNC(initMainScreen);
_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_main" >> "controls";
_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);
[_controls, _batteryData] call FUNC(loopRestoreControls);