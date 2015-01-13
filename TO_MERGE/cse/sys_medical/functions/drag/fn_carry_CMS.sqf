/*
	fnc_carry.sqf
	Usage: makes the calling unit start carrying the specified unit
	Author: Glowbal

	Arguments: array [caller (object), target (object)]
			1: caller (OBJECT), Object of type Man
			2: target (OBJECT), Object of type Man
	Returns: none

	Affects: Caller and target locality
	Executes: spawn
*/

private ["_caller", "_unit", "_positionUnit", "_killOnDrop"];
_caller = [_this, 0, objNull, [objNull]] call BIS_fnc_param;
_unit = [_this, 1, objNull, [objNull]] call BIS_fnc_param;


if (call cse_fnc_isSetTreatmentMutex_CMS) exitwith {};
[_caller] call cse_fnc_treatmentMutex_CMS;

if (!(_unit isKindOf "CaManBase") || !(_caller isKindOf "CaManBase")) exitwith{ [_caller,"release"] call cse_fnc_treatmentMutex_CMS; };
if (vehicle _caller != _caller || vehicle _unit != _unit) exitwith { [_caller,"release"] call cse_fnc_treatmentMutex_CMS;};

if (!([_caller] call cse_fnc_canInteract) || {_caller == _unit} || {(([_unit] call cse_fnc_isAwake))}) exitwith {
	["cse_fnc_drag_CMS call failed condition: canInteract, equal, is awake"] call cse_fnc_debug;
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};

if (([_caller] call cse_fnc_getCarriedObj) != _unit && !(isNull ([_caller] call cse_fnc_getCarriedObj)) || {!isNull(_unit getvariable ["cse_beingDragged_CMS",objNull]) || !isNull(_caller getvariable ["cse_dragging_CMS",objNull])} || {!isNull(_unit getvariable ["cse_beingCarried_CMS",objNull]) || !isNull(_caller getvariable ["cse_carrying_CMS",objNull])}) exitwith {
	[_caller,"release"] call cse_fnc_treatmentMutex_CMS;
	 ["carryobj reset"] call cse_fnc_debug;
	[_caller,objNull] call cse_fnc_carryObj;
};
_killOnDrop = false;
if (!alive _unit) then {
	_killOnDrop = true;
	_unit = [_unit,_caller] call cse_fnc_makeCopyOfBody_F;
};
if (isNull _unit) exitwith {};

if !([_caller,_unit] call cse_fnc_carryObj) exitwith {
	["couldn't carry object!"] call cse_fnc_debug; [_caller,"release"] call cse_fnc_treatmentMutex_CMS;
};
_unit setvariable ["cse_beingCarried_CMS",_caller,true];
_caller setvariable ["cse_carrying_CMS",_unit,true];
_caller selectWeapon (primaryWeapon _caller);

[_caller,"acinpercmstpsraswrfldnon",true] call cse_fnc_broadcastAnim;
_unit attachTo [_caller, [0.1, -0.1, -1.25], "LeftShoulder"];
[_unit,"AinjPfalMstpSnonWnonDf_carried_dead",true] call cse_fnc_broadcastAnim;

if (!isnil "CSE_DROP_ADDACTION_CMS") then {
	_caller removeAction CSE_DROP_ADDACTION_CMS;
	CSE_DROP_ADDACTION_CMS = nil;
};

CSE_DROP_ADDACTION_CMS = _caller addAction [format["Drop %1",[_unit] call cse_fnc_getName], {[_this select 1, _this select 2] call cse_fnc_drop_CMS;}];
[_caller,"release"] call cse_fnc_treatmentMutex_CMS;

[[_caller, _unit],"onCarryInjured"] call cse_fnc_customEventHandler_F;

waituntil {((isNull ([_caller] call cse_fnc_getCarriedObj)) || !([_caller] call cse_fnc_isAwake) || !(vehicle _caller == _caller))};
[_caller,ObjNull] call cse_fnc_carryObj;

if (([_caller] call cse_fnc_isAwake)) then {
	if (vehicle _unit == _unit) then {
		if (([_unit] call cse_fnc_isAwake)) then {
			[_unit,"",false] call cse_fnc_broadcastAnim;
		} else {
			[_unit,([_unit] call cse_fnc_getDeathAnim),false] call cse_fnc_broadcastAnim;
		};
	};
	if (vehicle _caller == _caller) then {
		[_caller,"",false] call cse_fnc_broadcastAnim;
	};
} else {
	if (vehicle _unit == _unit) then {
		if (([_unit] call cse_fnc_isAwake)) then {
			[_unit,"",false] call cse_fnc_broadcastAnim;
		} else {
			[_unit,([_unit] call cse_fnc_getDeathAnim),false] call cse_fnc_broadcastAnim;
		};
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
_unit setvariable ["cse_beingCarried_CMS",objNull,true];
_caller setvariable ["cse_carrying_CMS",objNull,true];

[[_caller, _unit, 1],"onDropInjured"] call cse_fnc_customEventHandler_F;