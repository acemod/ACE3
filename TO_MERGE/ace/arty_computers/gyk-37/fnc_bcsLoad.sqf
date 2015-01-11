//fnc_bcsLoad.sqf
#include "script_component.hpp"

/*
PREP(calcBallistics);
PREP(calcFiringSolution);
PREP(getBTable);
PREP(firingSolution);
PREP(formattedBTab);
PREP(switchMenu);
PREP(bcsUnload);
PREP(bcsLoad);
PREP(startMission);
PREP(parseGrid);
PREP(doCompute);
PREP(validateData);
PREP(validateTextField);
PREP(generateSolutions);
PREP(doFFE);
PREP(initMainScreen);
PREP(initMissionScreen);
PREP(populateObserverList);
PREP(returnMainScreen);
PREP(ammoSelectChange);
PREP(setFuzeSelection);
PREP(setFuzeSelectionMission);
PREP(loopRestoreControls);
PREP(bcsLog);
PREP(bcsLogWarn);
PREP(bcsLogError);
PREP(loopSaveControls);
PREP(ffeBack);
PREP(modifyObserver);
PREP(simpleBallistics);
PREP(populateKnownPointList);
PREP(selectObserver);
PREP(selectKnownPoint);
PREP(modifyKnownPoint);
PREP(loopResetControls);
PREP(callShot);
PREP(doAdjustment);
PREP(initAdjust);
PREP(doComputeAdjust);
PREP(endMission);
PREP(openMap);
PREP(adjustBack);
PREP(formatFireCommands);
*/
FUNC(changeSolution) = {
	_dir = _this select 0;
	_isAdjust = _this select 1;
	
	_solutions = GVAR(currentComputer) getVariable [QGVAR(currentSolutions),[]];
	_solutionsIndex = GVAR(currentComputer) getVariable [QGVAR(currentSolutionsIndex),0];
	
	_solutionsIndexNew = ((_solutionsIndex + _dir) max 0) min ((count _solutions)-1);
	GVAR(currentComputer) setVariable [QGVAR(currentSolutionsIndex),_solutionsIndexNew,true];
	if(_solutionsIndexNew != _solutionsIndex) then {
		_textLog = format["Selecting solution %1 of %2.", _solutionsIndexNew+1, (count _solutions)];
		BCSLOG(_textLog);
	};
	if(_isAdjust) then {
		[] call FUNC(doAdjustment);
	} else {
		[] call FUNC(doFFE);
	};
	
};


[] spawn {
	waitUntil {
		!(isNull (findDisplay 754))
	};
	waitUntil {
		!isNil QGVAR(currentComputer)
	};
	GVAR(currentScreen) = GVAR(currentComputer) getVariable[QGVAR(currentScreen), MAIN_ID];
	GVAR(lastPage) = GVAR(currentComputer) getVariable[QGVAR(lastPage), [[],[],0]];
	GVAR(missionCount) = GVAR(currentComputer) getVariable[QGVAR(missionCount), 0];
	GVAR(adjustCount) = GVAR(currentComputer) getVariable[QGVAR(adjustCount), 0];
	GVAR(currentState) = GVAR(currentComputer) getVariable [QGVAR(currentState), [[],[],0]];
	
	
	[GVAR(currentScreen)] call FUNC(switchMenu);
	_batteryData = GVAR(currentComputer) getVariable [QGVAR(batteryData), []];
	_logData = GVAR(currentComputer) getVariable [QGVAR(logData), []];
	
	_controls = configNamespace >> "ace_arty_bcs_Display" >> "controls";
	switch(GVAR(currentScreen)) do {
		case MAIN_ID: {
			_controls = _controls >> "ace_arty_bcs_main";
			[] call FUNC(initMainScreen);
		};
		case MISSION_ID: {
			_controls = _controls >> "ace_arty_bcs_mission";
			_currentMission = GVAR(currentComputer) getVariable QGVAR(currentMissionType);
			(_currentMission select 0) call FUNC(initMissionScreen);
		};
		case ADJUST_ID: {
			_controls = _controls >> "ace_arty_bcs_adjust";
		};
		case FFE_ID: {
			_controls = _controls >> "ace_arty_bcs_ffe";
		};
	};
	_controls = _controls >> "controls";
	
	if(count(_logData) == 0) then {
		BCSLOG("Initializing BCS v." + BCSVER + " Software");
		if(count(_batteryData) == 0) then {
			BCSWARN("Battery data is not initialized!");
		};
	} else {
		{
			[_x] call FUNC(bcsLog);
		} forEach _logData;
		
		if((count GVAR(currentState)) > 1) then {
			[_controls] call FUNC(loopRestoreControls);
		};
	};
	
	if((isClass(configFile >> "CfgPatches" >> "acre_main"))) then {
		ctrlShow [ACRE_CONTROLS, true];
		_activeRadio = player getVariable "acre_active_radio";

		_oblix = [_activeRadio] call acre_sys_radio_fnc_getRadioState;

		_freq = ((_oblix select 0) select 0);

		_baseConfig = inheritsFrom (configFile >> "CfgWeapons" >> _activeRadio);
		_realRadio = configName ( _baseConfig );
		_typeName = getText (configFile >> "CfgAcreRadios" >> _realRadio >> "name");

		ctrlSetText [IDC_ACRE_RadioName, _typeName];
		ctrlSetText [IDC_ACRE_RadioNet, format["%1MHz", _freq]];
	} else {
		ctrlShow [ACRE_CONTROLS, false];
	};
	[] spawn {
		_startTime = time;
		_xSpeed = 0;
		_ySpeed = 0;
		_sampleSize = 0;
		waitUntil {
			_wind = ACE_wind;
			_xSpeed = _xSpeed + (_wind select 0);
			_ySpeed = _ySpeed + (_wind select 1);
			_sampleSize = _sampleSize + 1;
			if(time - _startTime > 15) then {
				GVAR(averageWind) = [_xSpeed/_sampleSize, _ySpeed/_sampleSize, 0];
				_xSpeed = 0;
				_ySpeed = 0;
				_sampleSize = 0;
				_startTime = time;
				_p = GVAR(averageWind) call CBA_fnc_vect2polar;
				_logTxt = format["Average wind last 15 secs: %1m/s at %2 degrees", (_p select 0), (_p select 1)];
				//BCSLOG(_logTxt);
			};
			sleep 0.25;
			(isNil QGVAR(currentComputer))
		};
	};
};