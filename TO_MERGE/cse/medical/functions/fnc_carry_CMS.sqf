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


if (call FUNC(isSetTreatmentMutex_CMS)) exitwith {};
[_caller] call FUNC(treatmentMutex_CMS);

if (!(_unit isKindOf "CaManBase") || !(_caller isKindOf "CaManBase")) exitwith{ [_caller,"release"] call FUNC(treatmentMutex_CMS); };
if (vehicle _caller != _caller || vehicle _unit != _unit) exitwith { [_caller,"release"] call FUNC(treatmentMutex_CMS);};

if (!([_caller] call cse_fnc_canInteract) || {_caller == _unit} || {(([_unit] call EFUNC(common,isAwake)))}) exitwith {
	["FUNC(drag_CMS) call failed condition: canInteract, equal, is awake"] call EFUNC(common,debug);
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
};

if (([_caller] call EFUNC(common,getCarriedObj)) != _unit && !(isNull ([_caller] call EFUNC(common,getCarriedObj))) || {!isNull(_unit getvariable [QGVAR(beingDragged),objNull]) || !isNull(_caller getvariable [QGVAR(dragging),objNull])} || {!isNull(_unit getvariable [QGVAR(beingCarried),objNull]) || !isNull(_caller getvariable [QGVAR(carrying),objNull])}) exitwith {
	[_caller,"release"] call FUNC(treatmentMutex_CMS);
	 ["carryobj reset"] call EFUNC(common,debug);
	[_caller,objNull] call EFUNC(common,carryObj);
};
_killOnDrop = false;
if (!alive _unit) then {
	_killOnDrop = true;
	_unit = [_unit,_caller] call EFUNC(common,makeCopyOfBody_F);
};
if (isNull _unit) exitwith {};

if !([_caller,_unit] call EFUNC(common,carryObj)) exitwith {
	["couldn't carry object!"] call EFUNC(common,debug); [_caller,"release"] call FUNC(treatmentMutex_CMS);
};
_unit setvariable [QGVAR(beingCarried),_caller,true];
_caller setvariable [QGVAR(carrying),_unit,true];
_caller selectWeapon (primaryWeapon _caller);

[_caller,"acinpercmstpsraswrfldnon",true] call EFUNC(common,broadcastAnim);
_unit attachTo [_caller, [0.1, -0.1, -1.25], "LeftShoulder"];
[_unit,"AinjPfalMstpSnonWnonDf_carried_dead",true] call EFUNC(common,broadcastAnim);

if (!isnil QGVAR(DROP_ADDACTION)) then {
	_caller removeAction GVAR(DROP_ADDACTION);
	GVAR(DROP_ADDACTION) = nil;
};

GVAR(DROP_ADDACTION) = _caller addAction [format["Drop %1",[_unit] call EFUNC(common,getName)], {[_this select 1, _this select 2] call FUNC(drop_CMS);}];
[_caller,"release"] call FUNC(treatmentMutex_CMS);

[[_caller, _unit],"onCarryInjured"] call EFUNC(common,customEventHandler_F);

waituntil {((isNull ([_caller] call EFUNC(common,getCarriedObj))) || !([_caller] call EFUNC(common,isAwake)) || !(vehicle _caller == _caller))};
[_caller,ObjNull] call EFUNC(common,carryObj);

if (([_caller] call EFUNC(common,isAwake))) then {
	if (vehicle _unit == _unit) then {
		if (([_unit] call EFUNC(common,isAwake))) then {
			[_unit,"",false] call EFUNC(common,broadcastAnim);
		} else {
			[_unit,([_unit] call EFUNC(common,getDeathAnim)),false] call EFUNC(common,broadcastAnim);
		};
	};
	if (vehicle _caller == _caller) then {
		[_caller,"",false] call EFUNC(common,broadcastAnim);
	};
} else {
	if (vehicle _unit == _unit) then {
		if (([_unit] call EFUNC(common,isAwake))) then {
			[_unit,"",false] call EFUNC(common,broadcastAnim);
		} else {
			[_unit,([_unit] call EFUNC(common,getDeathAnim)),false] call EFUNC(common,broadcastAnim);
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
_unit setvariable [QGVAR(beingCarried),objNull,true];
_caller setvariable [QGVAR(carrying),objNull,true];

[[_caller, _unit, 1],"onDropInjured"] call EFUNC(common,customEventHandler_F);