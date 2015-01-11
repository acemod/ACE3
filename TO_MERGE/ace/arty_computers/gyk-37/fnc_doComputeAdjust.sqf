//fnc_doComputeAdjust.sqf
#include "script_component.hpp"
// PREP(doFFE);
// PREP(formatFireCommands);
_adjustData = [] call CBA_fnc_hashCreate;
_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls" >> "ace_arty_bcs_adjust" >> "controls";
_valid = [_controls, _adjustData] call FUNC(validateData);
_missionType = _this select 0;

if(_valid) then {
	_adjustments = GVAR(currentComputer) getVariable [QGVAR(currentAdjustments), []];
	_adjustments set[(count _adjustments), _adjustData];
	GVAR(currentComputer) setVariable [QGVAR(currentAdjustments), _adjustments, true];
	_missionData = GVAR(currentComputer) getVariable QGVAR(currentMission);
	_targetPos = [];
	_targetAlt = 0;
	
	
	_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
	_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];
	
	_solution = _solutions select _solutionsIndex;
	_ne = _solution select 2;

	_ot = parseNumber ([_adjustData, IDC_Adjust_AdjustOTDirInput] call CBA_fnc_hashGet);
	GVAR(currentOT) = _ot;
	_lr = parseNumber ([_adjustData, IDC_Adjust_AdjustLeftRightInput] call CBA_fnc_hashGet);
	_ad = parseNumber ([_adjustData, IDC_Adjust_AdjustAddDropInput] call CBA_fnc_hashGet);
	_ud = parseNumber ([_adjustData, IDC_Adjust_AdjustUpDownInput] call CBA_fnc_hashGet);
	if((_lr != 0 || _ad != 0 || _ud != 0)) then {
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
		_targetAlt = (_ne select 2) + _ud;
		
		_targetPos set[2, _targetAlt];

		_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);

		_gunNE = ([_batteryData, IDC_Main_BatteryGridInput] call CBA_fnc_hashGet) call FUNC(parseGrid);
		_gunAlt = parseNumber ([_batteryData, IDC_Main_BatteryAltInput] call CBA_fnc_hashGet);

		_gunPos = [(_gunNE select 0), (_gunNE select 1), _gunAlt];

		_dof = parseNumber ([_batteryData, IDC_Main_BatteryDOFInput] call CBA_fnc_hashGet);



		_roundType = ([_missionData, IDC_Mission_EngageAmmunitionTypeSelect] call CBA_fnc_hashGet) select 2;
		_fuzeType = ([_missionData, IDC_Mission_EngageFuzeTypeSelect] call CBA_fnc_hashGet) select 2;
		
		GVAR(generatingMission) = true;
		[_targetPos, _gunPos, _dof, _roundType, _fuzeType] spawn FUNC(generateSolutions);
	};
	[_missionType] spawn {
		_missionType = _this select 0;
		ctrlEnable [ADJUST_ID, false];
		waitUntil {
			!GVAR(generatingMission) 
		};
		ctrlEnable [ADJUST_ID, true];
		_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
		_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];
		if((count _solutions) > 0) then {
			_solution = _solutions select _solutionsIndex;
			if((count _solution) > 0) then {
				if(_missionType == 0) then {
					BCSLOG("NEW ADJUSTMENT COMPLETE");
					[] call FUNC(doAdjustment);
				} else {
					[] call FUNC(doFFE);
				};
			};
		};
	};
	
};