/*
fnc_drag.sqf
Usage: makes the calling unit start dragging the specified unit
Author: Glowbal

Arguments: array [unit (object), unit (object)]
		1: Caller OBJECT. Unit that initiats the dragging
		2: Target OBJECT. Unit that will be dragged
Returns: none

Affects: Caller and target Locality
Executes: spawn
*/
private ["_caller", "_unit", "_positionUnit", "_killOnDrop"];
_caller = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;

["cse_fnc_drag_CMS has been called",2] call cse_fnc_debug;

if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_caller] call cse_fnc_treatmentMutex_CMS;

if (!(_unit isKindOf "CaManBase") || !(_caller isKindOf "CaManBase")) exitwith{ [_caller,"release"] call cse_fnc_treatmentMutex_CMS;};
if (vehicle _caller != _caller || vehicle _unit != _unit) exitwith { [_caller,"release"] call cse_fnc_treatmentMutex_CMS;};

if (!([_caller] call cse_fnc_canInteract) || {_caller == _unit} || {(([_unit] call cse_fnc_isAwake))}) exitwith { ["cse_fnc_drag_CMS call failed condition: canInteract, equal, is awake"] call cse_fnc_debug;
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};

if (([_caller] call cse_fnc_getCarriedObj) != _unit && !(isNull ([_caller] call cse_fnc_getCarriedObj)) || {!isNull(_unit getvariable ["cse_beingDragged_CMS",objNull]) || !isNull(_caller getvariable ["cse_dragging_CMS",objNull])}) exitwith {
	 ["carryobj reset"] call cse_fnc_debug;
	[_caller,objNull] call cse_fnc_carryObj;
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};
_caller action ["WeaponOnBack", _caller];


_killOnDrop = false;
if (!alive _unit) then {
	_unit = [_unit,_caller] call cse_fnc_makeCopyOfBody_F;
	_killOnDrop = true;
	_unit playMove "AinjPpneMstpSnonWrflDb";
};
if (isNull _unit) exitwith {};

if !([_caller,_unit,[0.125, 1.007, 0]] call cse_fnc_carryObj) exitwith { [_caller,"release"] call cse_fnc_treatmentMutex_CMS; };
_unit setDir 180;
[_unit,"AinjPpneMstpSnonWrflDb",true] call cse_fnc_broadcastAnim;
_caller selectWeapon (primaryWeapon _caller);

if (currentWeapon _caller == primaryWeapon _caller) then {
	[_caller,"AcinPknlMstpSrasWrflDnon",true] call cse_fnc_localAnim;
} else {
	[_caller,"AcinPknlMstpSnonWnonDnon",true] call cse_fnc_localAnim;
};

_unit setvariable ["cse_beingDragged_CMS",_caller,true];
_caller setvariable ["cse_dragging_CMS",_unit,true];
if (!isnil "CSE_DROP_ADDACTION_CMS") then {
_caller removeAction CSE_DROP_ADDACTION_CMS;
	CSE_DROP_ADDACTION_CMS = nil;
};
CSE_DROP_ADDACTION_CMS = _caller addAction [format["Drop %1",[_unit] call cse_fnc_getName], {[_this select 1, _this select 2] call cse_fnc_drop_CMS;}];

[_caller,"release"] call cse_fnc_treatmentMutex_CMS;

[[_caller, _unit],"onDragInjured"] call cse_fnc_customEventHandler_F;

waituntil {((isNull ([_caller] call cse_fnc_getCarriedObj)) || !([_caller] call cse_fnc_isAwake))};
[_caller,ObjNull] call cse_fnc_carryObj;

_unit setvariable ["cse_beingDragged_CMS",objNull,true];
_caller setvariable ["cse_dragging_CMS",objNull,true];


if (([_caller] call cse_fnc_isAwake)) then {
	if (vehicle _unit == _unit) then {
		if (([_unit] call cse_fnc_isAwake)) then {
			[_unit,"AinjPpneMstpSnonWrflDb_release",false] call cse_fnc_broadcastAnim;
			//[_unit,"aidlppnemstpsraswrfldnon0s",false] call cse_fnc_broadcastAnim;
		} else {
			[_unit,([_unit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;
		};
	};
	if (vehicle _caller == _caller) then {
		[_caller,"amovpercmstpsraswrfldnon_amovpknlmstpslowwrfldnon",false] call cse_fnc_broadcastAnim;
	};
} else {
	if (([_unit] call cse_fnc_isAwake)) then {
		if (vehicle _unit == _unit) then {
			[_unit,"AinjPpneMstpSnonWrflDb_release",false] call cse_fnc_broadcastAnim;
			//[_unit,"aidlppnemstpsraswrfldnon0s",false] call cse_fnc_broadcastAnim;
		} else {
			[_unit,"",false] call cse_fnc_broadcastAnim;
		};
	} else {
		[_unit,([_unit] call cse_fnc_getDeathAnim)] call cse_fnc_broadcastAnim;
	};
};
if (!surfaceIsWater getPos _caller) then {
	sleep 0.5;
	if (vehicle _unit == _unit) then {
		if (vehicle _caller == _caller) then {
			_positionUnit = getPosATL _unit;
			_positionUnit set [2, (getPosATL _caller) select 2];
			_unit setPosATL _positionUnit;
		};
	};
};

if (_killOnDrop) then {
	_unit setDamage 1;
};

[[_caller, _unit, 0],"onDropInjured"] call cse_fnc_customEventHandler_F;