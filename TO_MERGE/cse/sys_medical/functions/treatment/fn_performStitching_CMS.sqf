/**
 * fn_performStitching_CMS.sqf
 * @Descr: N/A
 * @Author: Glowbal
 *
 * @Arguments: []
 * @Return:
 * @PublicAPI: false
 */

#define WAITING_TIME_SMALL 2.5
#define WAITING_TIME_MEDIUM 3.5
#define WAITING_TIME_LARGE 4.5

#define WAITING_TIMES_WOUNDS [WAITING_TIME_SMALL, WAITING_TIME_MEDIUM, WAITING_TIME_LARGE]

private ["_injuredPerson", "_treatingPerson", "_selectionName", "_removeItem", "_prevAnim", "_bandagedWounds", "_bodyPartN", "_allWounds", "_totalWoundsCount", "_totalTime", "_startTimeOfStitching", "_indexStitch", "_woundstoStitchOf", "_afterStitchingWoundsCount", "_waitingTime", "_i", "_startTime", "_messageSend"];
_injuredPerson = _this select 0;
_treatingPerson = _this select 1;
_selectionName = _this select 2;
_removeItem = _this select 3;

if (!([_treatingPerson, _injuredPerson, _removeItem] call cse_fnc_hasEquipment_CMS)) exitwith {};
if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_treatingPerson,"set"] call cse_fnc_treatmentMutex_CMS;

[_treatingPerson,"STR_CSE_CMS_STITCHING","STR_CSE_CMS_START_STITCHING_INJURIES", 0, [[_injuredPerson] call cse_fnc_getName,_selectionName]] call cse_fnc_sendDisplayMessageTo;


_prevAnim = "";
if (vehicle _treatingPerson == _treatingPerson && (vehicle _injuredPerson == _injuredPerson)) then {
	if (primaryWeapon _treatingPerson == "") then {
		_prevAnim = animationState _treatingPerson;
	};
	[_treatingPerson,"AinvPknlMstpSlayWrflDnon_medic"] call cse_fnc_localAnim;
};
_bandagedWounds = [_injuredPerson,"cse_bandagedWounds"] call cse_fnc_getVariable;
_bodyPartN = [_selectionName] call cse_fnc_getBodyPartNumber_CMS;

_allWounds = _bandagedWounds select _bodyPartN;
_totalWoundsCount = (_allWounds select 0) + (_allWounds select 1) + (_allWounds select 2);
_totalTime = ((_allWounds select 0) * 2.5) + ((_allWounds select 1) * 3.5) + ((_allWounds select 2) * 4.5);

CSE_ORIGINAL_POSITION_PLAYER_CMS = getPos _treatingPerson;
CSE_CONDITION_STITCHING_CMS = {((vehicle player != player) ||((getPos player) distance CSE_ORIGINAL_POSITION_PLAYER_CMS) < 1)};
CSE_RUNNING_STITCHING_CMS = true;

_startTimeOfStitching = diag_tickTime;
_totalTime spawn {
	CSE_RUNNING_STITCHING_CMS = [_this, CSE_CONDITION_STITCHING_CMS, {},{[player, "STR_CSE_CMS_CANCELED", ["STR_CSE_CMS_ACTION_CANCELED","STR_CSE_CMS_YOU_MOVED_AWAY"]] call cse_fnc_sendDisplayInformationTo;}] call cse_fnc_gui_loadingBar;
};

_indexStitch = 0;
while {CSE_RUNNING_STITCHING_CMS && _indexStitch < 3} do {
	_woundstoStitchOf = _allWounds select _indexStitch;
	_afterStitchingWoundsCount = _woundstoStitchOf;
	_waitingTime = WAITING_TIMES_WOUNDS select _indexStitch;

	for [{_i=0}, {_i< (ceil _woundstoStitchOf)}, {_i=_i+1}] do {
		_startTime = diag_tickTime;
		waitUntil {(diag_tickTime - _startTime > _waitingTime) || !CSE_RUNNING_STITCHING_CMS};
		if (CSE_RUNNING_STITCHING_CMS) then {
			// TODO play sound
			_afterStitchingWoundsCount = _afterStitchingWoundsCount - 1;
		};
	};

	if (_afterStitchingWoundsCount < 0) then {
		_afterStitchingWoundsCount = 0;
	};
	_allWounds set [_indexStitch, _afterStitchingWoundsCount];
	_indexStitch = _indexStitch + 1;
};
_bandagedWounds set [_bodyPartN, _allWounds];
[_injuredPerson, "cse_bandagedWounds", _bandagedWounds] call cse_fnc_setVariable;

[_injuredPerson,"treatment",format["%1 has stitched up some bandages wounds",[_treatingPerson] call cse_fnc_getName]] call cse_fnc_addActivityToLog_CMS;

if (_prevAnim != "") then {
	_treatingPerson switchMove _prevAnim;
};

[_treatingPerson,"release"] call cse_fnc_treatmentMutex_CMS;