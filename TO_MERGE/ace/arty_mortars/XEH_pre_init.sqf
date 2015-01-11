//#define DEBUG_MODE_FULL
#include "script_component.hpp"

ADDON = false;

GVAR(activeGun) = nil;
GVAR(m137Gun) = nil;
GVAR(gunActionIds) = [];
GVAR(m137_shift) = false;
GVAR(m137_ctrl) = false;

PREP(endShift);
PREP(alignGun);

PREP(adjustTraverse);
PREP(adjustElevation);
PREP(recoil);
PREP(levelGun);

PREP(m137_monitorSight);
PREP(m137_bubbleLevel);
PREP(m137_keyDown);
PREP(m137_keyUp);
PREP(m137_stopMonitorSight);
PREP(m137_adjustAzimuth);
PREP(m137_adjustElevation);
PREP(m137_adjustReset);
PREP(m137_adjustOpticElevation);
PREP(m137_changeView);

PREP(XEH_getin);
PREP(XEH_getout);

PREP(textPad);

PREP(FOR);

FUNC(swapFireReload) = {
	private ["_current"];
	PARAMS_1(_unit);
	_current = _unit getVariable [QGVAR(fireReload), false];
	if (_current) then {
		hintSilent "Fire on Load: Disabled";
	} else {
		hintSilent "Fire on Load: Enabled";
	};
	_unit setVariable [QGVAR(fireReload), !_current];
};


FUNC(assemble) = {
	// TODO: Integrate into sys_crewserved somehow or keep individual, if more such stuff is included, maybe A3...
	private ["_pos","_mortar"];
	PARAMS_2(_front,_rear);	
	_pos = getPosATL _front; // Needed to align APOBS on the Front assembly // TODO: Check geometry (kills player)
	{ deleteVehicle _x } foreach [_front,_rear];
	player setVariable ["ACE_PB_Result", 0];
	_time = getNumber(configFile >> "CfgVehicles" >> "ACE_120Tampella" >> "ACE" >> "ACE_CREWSERVED" >> "mountTime");
	[_time,[format [localize "STR_ACE_DN_MINESWEEPER_ASS_APOBS","120mm Tampella"]],true,true] spawn ace_progressbar;
	waitUntil { (player getVariable "ACE_PB_Result" != 0) };
	if (player getVariable "ACE_PB_Result" == 1) then {
		_mortar = "ACE_120Tampella" createVehicle [0,0,0];
		_mortar setVelocity [0,0,0];
		_mortar setPosATL _pos;
		_mortar setDir getDir player;
	};	
};

[QGVAR(trigger_mon), { _this call FUNC(trigger_monitor) }] call CBA_fnc_addEventHandler;
//[QGVAR(useFOR), { _this spawn FUNC(FOR) }] call ACE_fnc_addReceiverOnlyEventhandler;

FUNC(trigger_monitor) = {
	private "_trg";
	PARAMS_1(_gun);
	if (isServer) then {
		_trg=createTrigger ["EmptyDetector",getPos _gun];
		_trg setTriggerArea [5,5,0,false];
		_trg setTriggerActivation ["ANY","PRESENT",true];
		_trg triggerAttachVehicle [_gun];
		_trg setTriggerStatements ["(triggerAttachedVehicle thisTrigger) ammo (weapons (triggerAttachedVehicle thisTrigger) select 0) > 0", "(triggerAttachedVehicle thisTrigger) spawn ace_sys_arty_mortars_fnc_for", ""];
		//_trg setTriggerStatements ["(triggerAttachedVehicle thisTrigger) ammo (weapons (triggerAttachedVehicle thisTrigger) select 0) > 0", "[""ace_sys_arty_mortars_useFOR"", (triggerAttachedVehicle thisTrigger)] call ACE_fnc_receiverOnlyEvent", ""]; 
	};
};

FUNC(m137_OpticBubbleLevel) = {
	private["_levelStr", "_bubbleStr", "_difPercent", "_difInt", "_lvlArr", "_bubbleArr", "_retStr"];
	PARAMS_4(_ctrl,_level,_range,_gun);

	_opticLevel = _gun animationPhase "OpticElevate";
	_barrelLevel = _gun animationPhase "MainGun";
	
	_dif = _barrelLevel - _opticLevel;
	
	_levelStr = "----|-|----";
	_bubbleStr = "o";
	_difPercent = (abs _dif)/_range;
	_difInt = round((_difPercent/2)*10);
	_difInt = (_difInt max 0) min 5;
	if(_dif > 0) then {
		_difInt = _difInt * -1;
	};
	_difInt = _difInt + 5;
	_lvlArr = toArray _levelStr;
	_bubbleArr = toArray _bubbleStr;
	_lvlArr set[_difInt, (_bubbleArr select 0)];
	_retStr = toString _lvlArr;
	_retStr = format["|%1|", _retStr];
	ctrlSetText [_ctrl, _retStr];
};


ADDON = true;
