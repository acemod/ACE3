/**
 * fn_updateUIInfo_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */


private ["_targetObj","_bodyPartText","_bodyPartN","_openWounds","_bandagedWounds","_fractures","_listOfWounds","_listOfBandagedWounds","_listOfFractures","_counter","_nameEntry","_untreatedWounds" ,"_remainder", "_numberOf", "_airwayStatus", "_airwayTreated"];
_targetObj = _this select 0;

_bodyPartText = (call cse_fnc_getSelectedBodyPart_CMS);
_bodyPartN = [_bodyPartText] call cse_fnc_getBodyPartNumber_CMS;

if (_bodyPartN < 0 || _bodyPartN > 5) exitwith {};
_openWounds = [_targetObj,"cse_openWounds"] call cse_fnc_getVariable;
_bandagedWounds = [_targetObj,"cse_bandagedWounds"] call cse_fnc_getVariable;
_fractures = [_targetObj,"cse_fractures"] call cse_fnc_getVariable;
_airwayStatus = [_targetObj,"cse_airway"] call cse_fnc_getVariable;
/*_openWounds = [_targetObj,"cse_openWounds"] call cse_fnc_getMonitoredVariableValue;
_bandagedWounds = [_targetObj,"cse_bandagedWounds"] call cse_fnc_getMonitoredVariableValue;
_fractures = [_targetObj,"cse_fractures"] call cse_fnc_getMonitoredVariableValue;*/

if (count _this > 1) then {
	switch (_this select 1) do {
		case "cse_openWounds": { _openWounds = _this select 2; };
		case "cse_bandagedWounds": { _bandagedWounds = _this select 2; };
		case "cse_fractures": { _fractures = _this select 2; };
	};
};

[_openWounds,_bandagedWounds] spawn cse_fnc_updateBodyImg_CMS;
_listOfWounds = _openWounds select _bodyPartN;
_listOfBandagedWounds = _bandagedWounds select _bodyPartN;
_listOfFractures = _fractures select _bodyPartN;

// TODO collect all information first, then clear the lb and fill in with details. Also; use ctrl instead of IDC.
_numberOf = 0;
lbClear 213;

_displayBodyPartText = switch (_bodyPartText) do {
		case "head": {
			localize "STR_CSE_UI_HEAD";
		};
		case "body": {
			localize "STR_CSE_UI_TORSO";
		};
		case "hand_r": {
			localize "STR_CSE_UI_ARM_R";
		};
		case "hand_l": {
			localize "STR_CSE_UI_ARM_L";
		};
		case "leg_r": {
			localize "STR_CSE_UI_LEG_R";
		};
		case "leg_l": {
			localize "STR_CSE_UI_LEG_L";
		};
		default {"-"};
};


lbadd[213,format[localize "STR_CSE_UI_SELECTED_BODY_PART",_displayBodyPartText]];
lbSetData [213, _numberOf, ""];
lbSetColor [213, _numberOf, [0.27, 0.40, 0.26, 1]];
//[] spawn cse_fnc_updateActivityLog_CMS;
_numberOf = _numberOf + 1;

if (CSE_ALLOW_AIRWAY_INJURIES_CMS) then {
	_airwayTreated = _targetObj getvariable ["cse_airwayTreated", false];

	if (_airwayStatus > 0) then {
		_nameEntry = switch (_airwayStatus) do {
			case 0: {localize "STR_CSE_UI_NORMAL_BREATHING"};
			case 1: {localize "STR_CSE_UI_DIFFICULT_BREATHING"};
			case 2: {localize "STR_CSE_UI_ALMOST_NO_BREATHING"};
			default {localize "STR_CSE_UI_NO_BREATHING"};
		};

		if (!(alive _targetObj) || (_targetObj getvariable ["cse_isDead", false])) then {
			lbadd[213,format["%1",localize "STR_CSE_UI_NO_BREATHING"]];
		} else {
			lbadd[213,format["%1",_nameEntry]];
		};
		lbSetData [213, _numberOf, ""];
		_numberOf = _numberOf + 1;
	} else {
		if (!(alive _targetObj) || (_targetObj getvariable ["cse_isDead", false])) then {
			lbadd[213,format["%1",localize "STR_CSE_UI_NO_BREATHING"]];
			lbSetData [213, _numberOf, ""];
			_numberOf = _numberOf + 1;
		};
	};

	if (_airwayTreated) then {
		lbadd[213,localize "STR_CSE_UI_STATUS_NPA_APPLIED"];
		lbSetData [213, _numberOf, ""];
		lbSetColor [213, _numberOf, [0.5, 0.5, 0, 1]];
		_numberOf = _numberOf + 1;
	};
};

if (([_targetObj,"cse_isBleeding_CMS"] call cse_fnc_getVariable)) then {
	lbadd[213,localize "STR_CSE_UI_STATUS_BLEEDING"];
	lbSetData [213, _numberOf, ""];
	_numberOf = _numberOf + 1;
};
if (([_targetObj,"cse_hasLostBlood_CMS"] call cse_fnc_getVariable)) then {
	lbadd[213,localize "STR_CSE_UI_STATUS_LOST_BLOOD"];
	lbSetData [213, _numberOf, ""];
	_numberOf = _numberOf + 1;
};

if (([_targetObj,"cse_hasPain_CMS"] call cse_fnc_getVariable)) then {
	lbadd[213,localize "STR_CSE_UI_STATUS_PAIN"];
	lbSetData [213, _numberOf, ""];
	_numberOf = _numberOf + 1;
};
if (([_targetObj, _bodyPartText] call cse_fnc_hasTourniquetAppliedTo_CMS)) then {
	lbadd[213,localize "STR_CSE_UI_STATUS_TOURNIQUET_APPLIED"];
	lbSetColor [213, _numberOf, [0.5, 0.5, 0, 1]];
	lbSetData [213, _numberOf, ""];
	_numberOf = _numberOf + 1;
};

_counter = 0;
{
	if (_x > 0) then {

		_untreatedWounds = floor _x;
		_remainder = _x - (floor _x);

		_nameEntry = switch (_counter) do {
			case 0: {localize "STR_CSE_UI_SMALL"};
			case 1: {localize "STR_CSE_UI_MEDIUM"};
			case 2: {localize "STR_CSE_UI_LARGE"};
			default {localize "STR_CSE_UI_SMALL"};
		};

		if (_untreatedWounds > 1) then {
			lbadd[213,format[localize "STR_CSE_UI_MULTIPLE_OPEN_WOUNDS",_nameEntry,_untreatedWounds]];
			lbSetData [213, _numberOf, format["open_wound_%1",_counter]];
			lbSetColor [213, _numberOf, [0.6, 0, 0, 1]];
			_numberOf = _numberOf + 1;
		} else {
			if (_untreatedWounds == 1) then {
				lbadd[213,format[localize "STR_CSE_UI_SINGLE_OPEN_WOUND",_nameEntry]];
				lbSetData [213, _numberOf, format["open_wound_%1",_counter]];
				lbSetColor [213, _numberOf, [0.6, 0, 0, 1]];
				_numberOf = _numberOf + 1;
			};
		};

		if (_remainder > 0) then {
			lbadd[213,format[localize "STR_CSE_UI_PARTIAL_OPEN_WOUND",_nameEntry]];
			lbSetData [213, _numberOf, format["open_wound_%1",_counter]];
			lbSetColor [213, _numberOf, [0.6, 0, 0, 1]];
			_numberOf = _numberOf + 1;
		};
	};
	_counter = _counter + 1;
}foreach _listOfWounds;

_counter = 0;
{
	if (_x > 0) then {

		_untreatedWounds = floor _x;
		_remainder = _x - (floor _x);

		_nameEntry = switch (_counter) do {
			case 0: {localize "STR_CSE_UI_SMALL"};
			case 1: {localize "STR_CSE_UI_MEDIUM"};
			case 2: {localize "STR_CSE_UI_LARGE"};
			default {localize "STR_CSE_UI_SMALL"};
		};

		if (_untreatedWounds > 1) then {
			lbadd[213,format[localize "STR_CSE_UI_MULTIPLE_BANDAGED_WOUNDS",_nameEntry,_untreatedWounds]];
			lbSetData [213, _numberOf, format["bandaged_wound_%1",_counter]];
			_numberOf = _numberOf + 1;
		} else {
			if (_untreatedWounds == 1) then {
				lbadd[213,format[localize "STR_CSE_UI_SINGLE_BANDAGED_WOUND",_nameEntry]];
				lbSetData [213, _numberOf, format["bandaged_wound_%1",_counter]];
				_numberOf = _numberOf + 1;
			};
		};

		if (_remainder > 0) then {
			lbadd[213,format[localize "STR_CSE_UI_PARTIAL_BANDAGED_WOUND",_nameEntry]];
			lbSetData [213, _numberOf, format["bandaged_wound_%1",_counter]];
			_numberOf = _numberOf + 1;
		};
	};
	_counter = _counter + 1;
}foreach _listOfBandagedWounds;

_counter = 0;
{
	if (_x > 0) then {
		_nameEntry = switch (_counter) do {
			case 0: {localize "STR_CSE_UI_SMALL"};
			case 1: {localize "STR_CSE_UI_MEDIUM"};
			case 2: {localize "STR_CSE_UI_LARGE"};
			default {localize "STR_CSE_UI_SMALL"};
		};
		lbadd[213,format["%1 Fracture x%2",_nameEntry,_x]];
		lbSetData [213, _numberOf, ""];
		_numberOf = _numberOf + 1;
	};
	_counter = _counter + 1;
}foreach _listOfFractures;

