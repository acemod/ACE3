#include "script_component.hpp"

_solution = _this select 0;
_roundCount = _this select 1;
_ammoType = _this select 2;
_fuze = _this select 3;
_moc = _this select 4;
_adjust = false;

if((count _this) > 5) then {
	_adjust = _this select 5;
};
_missionType = GVAR(currentComputer) getVariable QGVAR(currentMissionType);
_batteryData = GVAR(currentComputer) getVariable QGVAR(batteryData);

_standard = "FIRE MISSION, ";

_deflection = 0;
if((count _solution) > 0) then {
	_deflection = round ((_solution select 0) select 1);
};

if(_adjust) then {
	_standard = _standard + format["PLATOON ADJUST, NUMBER %1, ", ([_missionData, IDC_Mission_EngageAdjustPieceInput] call CBA_fnc_hashGet)];
} else {
	_standard = _standard + "PLATOON ";
};
_adjustRoundCount = parseNumber ([_missionData, IDC_Mission_EngageAdjustRoundCountInput] call CBA_fnc_hashGet);
if(_adjust) then {
	if(_adjustRoundCount > 1) then {
		_standard = _standard + format["%1 ROUNDS, ", _adjustRoundCount];
	} else {
		_standard = _standard + "1 ROUND, ";
	};
} else {
	if(_roundCount > 1) then {
		_standard = _standard + format["%1 ROUNDS, ", _roundCount];
	} else {
		_standard = _standard + "1 ROUND, ";
	};
};

_special = "";
if(_moc != "ready") then {
	_special = _special + "SPECIAL INSTRUCTIONS, ";
	if(_moc == "totn" || _moc == "totc") then {
		_special = _special + "DO NOT LOAD, ";
	};
	_special = _special + "AT MY COMMAND, ";
};
if((abs(3200-_deflection)) > 400) then {
	_dof = parseNumber ([_batteryData, IDC_Main_BatteryDOFInput] call CBA_fnc_hashGet);
	_dif = _deflection-3200;
	_az = round((_dof + _dif) mod 6400);
	if(_az < 0) then {
		_az = _az + 6400;
	};
	_azText = (str _az);
	if(_az < 1000) then {
		_azText = "0" + _azText;
	};
	if(_az < 100) then {
		_azText = "0" + _azText;
	};
	if(_az < 10) then {
		_azText = "0" + _azText;
	};
	_special = _special + format["AZIMUTH %1, ", _azText];
};



if(_special != "") then {
	_standard = _standard + _special;
};

_ammoDisplay = getText(configFile >> "CfgMagazines" >> _ammoType >> "ACE_ARTY_INEFFECT");
if(!_adjust) then {
	_standard = _standard + format["SHELL %1, ", _ammoDisplay];
};





switch (toLower _fuze) do {
	case "time": {
		_fuze = "time";
	};
	case "prox": {
		_fuze = "vt";
	};
	case "pd": {
		_fuze = "quick";
	};
};

_deflectionText = (str _deflection);
if(_deflection < 1000) then {
	_deflectionText = "0" + _deflectionText;
};
if(_deflection < 100) then {
	_deflectionText = "0" + _deflectionText;
};
if(_deflection < 10) then {
	_deflectionText = "0" + _deflectionText;
};




_mtoStandard = "";
_mto = "";
if(!_adjust || GVAR(adjustCount) == 0) then {
	if((_missionType select 0) == "polar") then {
		_mtoStandard = _mtoStandard + format["%1, ", toUpper ([_missionData, IDC_Mission_MissionPolarObserverInput] call CBA_fnc_hashGet)];
	} else {
		_mtoStandard = _mtoStandard + "OBSERVER, ";
	};
};
_mtoStandard = _mtoStandard + format["%1, ", toUpper ([_batteryData, IDC_Main_FDCCallsignInput] call CBA_fnc_hashGet)];
if(_adjust) then {
	_mtoStandard = _mtoStandard + "HE IN EFFECT, ";
} else {
	if(_ammoDisplay != "HE") then {
		_mtoStandard = _mtoStandard + format["%1 IN EFFECT, ", _ammoDisplay];
	} else {
		if(_fuze != "pd") then {
			_mtoStandard = _mtoStandard + format["%1 IN EFFECT, ", toUpper _fuze];
		};
	};
};

if(_adjust) then {
	if(_adjustRoundCount > 1) then {
		_mtoStandard = _mtoStandard + format["%1 ROUNDS, ", _adjustRoundCount];
	} else {
		_mtoStandard = _mtoStandard + "1 ROUND, ";
	};
} else {
	if(_roundCount > 1) then {
		_mtoStandard = _mtoStandard + format["%1 ROUNDS, ", _roundCount];
	} else {
		_mtoStandard = _mtoStandard + "1 ROUND, ";
	};
};
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

_mtoStandard = _mtoStandard + format["%1%2, ", (toUpper _targetPrefix), _targetNumberText];

_mto = _mtoStandard;

_solutionText = "";
if((count _solution) > 0) then {
	_solutionText = _standard;

	_solutionText = _solutionText + format["CHARGE %1, ", (_solution select 1)];
	if(!_adjust) then {
		_solutionText = _solutionText + format["FUZE %1, ", toUpper _fuze];
	};
	
	_fuzeText = "";
	_fuzeTimeFull = ((_solution select 0) select 2);
	_fuzePrec = (floor((_fuzeTimeFull - (floor _fuzeTimeFull))*10))/10;
	_fuzeTime = (floor _fuzeTimeFull)+_fuzePrec;
	if(_fuze == "time") then {
		_fuzeText = format["TIME %1", _fuzeTime];
	};
	_mto = _mto + format["TOF %1", _fuzeTime];
	
	if(!_adjust && _fuzeText != "") then {
		_solutionText = _solutionText + _fuzeText + ", ";
	};
	
	_solutionText = _solutionText + format["DEFLECTION %1, ", _deflectionText];
	_solutionText = _solutionText + format["QUADRANT %1", ((_solution select 0) select 0)];
	
	if(_adjust) then {
		if(_roundCount > 1) then {
			_solutionText = _solutionText + format[", %1 ROUNDS, ", _roundCount];
		} else {
			_solutionText = _solutionText + ", 1 ROUND, ";
		};
		if(_ammoDisplay != "HE") then {
			_solutionText = _solutionText + format["%1 IN EFFECT, FUZE %2, ", _ammoDisplay, (toUpper _fuze)];
			_solutionText = _solutionText + _fuzeText;
		} else {
			_solutionText = _solutionText + format["FUZE %1 IN EFFECT", toUpper _fuze];
			if(_fuzeText != "") then {
				_solutionText = _solutionText + ", " + _fuzeText;
			};
		};
	};
};

[_solutionText, _mto]