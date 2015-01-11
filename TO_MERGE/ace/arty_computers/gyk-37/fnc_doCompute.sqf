//fnc_doCompute.sqf
#include "script_component.hpp"
// PREP(doFFE);
// PREP(formatFireCommands);
_isAdjust = _this select 0;
_missionData = [] call CBA_fnc_hashCreate;
_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_mission" >> "controls";
_valid = [_controls, _missionData] call FUNC(validateData);
if(_valid) then {
	GVAR(currentComputer) setVariable [QGVAR(currentMission), _missionData, true];
	_missionType = GVAR(currentComputer) getVariable QGVAR(currentMissionType);
	_targetPos = [];
	_targetAlt = 0;
	switch (toLower(_missionType select 0)) do {
		case "grid": {
			_ne = ([_missionData, IDC_Mission_MissionGridGridInput] call CBA_fnc_hashGet) call FUNC(parseGrid);
			_alt = [_missionData, IDC_Mission_MissionGridAltInput] call CBA_fnc_hashGet;
			_targetPos = [(_ne select 0), (_ne select 1), (parseNumber _alt)];
			_targetAlt = (parseNumber _alt);
		};
		case "polar": {
			_ne = ([_missionData, IDC_Mission_MissionPolarObserverPosInput] call CBA_fnc_hashGet) call FUNC(parseGrid);
			_alt = parseNumber ([_missionData, IDC_Mission_MissionPolarObserverAltInput] call CBA_fnc_hashGet);
			_ot = parseNumber ([_missionData, IDC_Mission_MissionPolarOTDirInput] call CBA_fnc_hashGet);
			GVAR(currentOT) = _ot;
			_range = parseNumber ([_missionData, IDC_Mission_MissionPolarRangeInput] call CBA_fnc_hashGet);
			_altDif = parseNumber ([_missionData, IDC_Mission_MissionPolarAltDifInput] call CBA_fnc_hashGet);
			
			_targetPos = [_ne, _range, MIL2DEG(_ot)] call BIS_fnc_relPos;
			_targetAlt = _alt + _altDif;
			
			_targetPos set[2, _targetAlt];
		};
		case "shift": {
			_knownPoints = GVAR(currentComputer) getVariable [QGVAR(knownPoints), []];
			_index = lbCurSel IDC_Mission_MissionShiftKnowPointSelect;
			_val = lbValue [IDC_Mission_MissionShiftKnowPointSelect, _index];
			_knownPoint = _knownPoints select _val;
			_ne = (_knownPoint select 1) call FUNC(parseGrid);
			_alt = parseNumber (_knownPoint select 2);
			_ot = parseNumber ([_missionData, IDC_Mission_MissionShiftOTDirInput] call CBA_fnc_hashGet);
			GVAR(currentOT) = _ot;
			_lr = parseNumber ([_missionData, IDC_Mission_MissionShiftLeftRightInput] call CBA_fnc_hashGet);
			_ad = parseNumber ([_missionData, IDC_Mission_MissionShiftAddDropInput] call CBA_fnc_hashGet);
			_ud = parseNumber ([_missionData, IDC_Mission_MissionShiftUpDownInput] call CBA_fnc_hashGet);
			_lrDir = 0;
			_adDir = 0;
			if(_lr < 0) then {
				_lrDir = (_ot + 4800) mod 6400;
			} else {
				_lrDir = (_ot + 1600) mod 6400;
			};
			if(_ad < 0) then {
				_adDir = (_ot + 3200) mod 6400;
			} else {
				_adDir = _ot;
			};
			_targetPos = [_ne, (abs _lr), MIL2DEG(_lrDir)] call BIS_fnc_relPos;
			_targetPos = [_targetPos, (abs _ad), MIL2DEG(_adDir)] call BIS_fnc_relPos;
			_targetAlt = _alt + _ud;
			
			_targetPos set[2, _targetAlt];
		};
	};
	_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);

	_gunNE = ([_batteryData, IDC_Main_BatteryGridInput] call CBA_fnc_hashGet) call FUNC(parseGrid);
	_gunAlt = parseNumber ([_batteryData, IDC_Main_BatteryAltInput] call CBA_fnc_hashGet);

	_gunPos = [(_gunNE select 0), (_gunNE select 1), _gunAlt];

	_dof = parseNumber ([_batteryData, IDC_Main_BatteryDOFInput] call CBA_fnc_hashGet);



	_roundType = ([_missionData, IDC_Mission_EngageAmmunitionTypeSelect] call CBA_fnc_hashGet) select 2;
	_fuzeType = ([_missionData, IDC_Mission_EngageFuzeTypeSelect] call CBA_fnc_hashGet) select 2;
	
	GVAR(generatingMission) = true;
	[_targetPos, _gunPos, _dof, _roundType, _fuzeType] spawn FUNC(generateSolutions);
	_isAdjust spawn {
		_isAdjust = _this;
		ctrlEnable [MISSION_ID, false];
		waitUntil {
			!GVAR(generatingMission) 
		};
		ctrlEnable [MISSION_ID, true];
		_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
		_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];
		if((count _solutions) > 0) then {
			_solution = _solutions select _solutionsIndex;
			if((count _solution) > 0) then {
				if(_isAdjust) then {
					[] call FUNC(doAdjustment);
				} else {
					[] call FUNC(doFFE);
				};
			};
		};
	};
	
};