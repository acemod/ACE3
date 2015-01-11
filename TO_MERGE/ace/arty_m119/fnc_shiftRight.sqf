//fnc_shiftLeft.sqf
#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

private["_phase", "_absPhase", "_degPhase", "_found_anim", "_setDir"];

PARAMS_1(_gun);

//_dn = getText(configFile >> "CfgVehicles" >> typeOf _gun >> "displayName");
//_actionText = format[localize "STR_ACE_ARTY_STOPSHIFTHOWITZER",_dn];

GVAR(dragGun) = _gun;
closeDialog 0;
player attachTo [_gun, [0,0,-0.27], "shift_right"];

// player switchMove "ACINPKNLMSTPSRASWRFLDNON";

GVAR(stopDragging) = false;
_phase = GVAR(dragGun) animationPhase "MainTurret";

_absPhase = (abs _phase) mod 6400;

if(_phase < 0) then {
	_absPhase = 6400-_absPhase;
};
_degPhase = MIL2DEG(_absPhase);

player setDir (_degPhase + 70) mod 360;

FUNC(handleKeydown) = {
	private["_handled", "_ctrl", "_dikCode", "_shift", "_ctrl", "_alt", "_phase"];
	_ctrl = _this select 0;
	_dikCode = _this select 1;
	_shift = _this select 2;
	_ctrl = _this select 3;
	_alt = _this select 4;
	_result = true;
	_size = 40;
	if (_ctrl) then {
		_size = 20;
	};
	if (_shift) then {
		_size = 1;
	};
	if(_dikCode in (actionKeys "moveBack")) then {
		_phase = GVAR(dragGun) animationPhase "MainTurret";
		_phase = (floor _phase);
		GVAR(dragGun) animate["MainTurret", (_phase+_size)];
		_result = false;
	};
	if(_dikCode in (actionKeys "stand") || _dikCode in (actionKeys "crouch")) then {
		[] call FUNC(endShift);
		_result = true;
	};
	_result
};

//#define ACE_TEXT_RED(Text) ("<t color='#FF0000'>" + ##Text + "</t>")

GVAR(drag_keyDownId) = (findDisplay 46) displayAddEventHandler ["KeyDown", QUOTE(_this call FUNC(handleKeydown))];
_found_anim = false;

player playActionNow "grabDrag";
//GVAR(shiftActionId) = player addAction [ACE_TEXT_RED(_actionText), QPATHTO_F(fnc_endShift.sqf), [], 100, false, false, "", ""];
waitUntil { animationState player == "ACINPKNLMSTPSRASWRFLDNON" };

while { !GVAR(stopDragging) } do {
	if( !(alive player) || !(alive GVAR(dragGun)) ) exitWith {
		[] call FUNC(endShift);
	};
	if !(animationState player in ["acinpknlmstpsraswrfldnon","acinpknlmwlksraswrfldb"]) exitWith {
		player switchMove "ACINPKNLMSTPSRASWRFLDNON";
		[] call FUNC(endShift);
	};
	_phase = GVAR(dragGun) animationPhase "MainTurret";

	_absPhase = (abs _phase) mod 6400;

	if(_phase < 0) then {
		_absPhase = 6400-_absPhase;
	};
	_degPhase = MIL2DEG(_absPhase);
	_setDir = (_degPhase + 70) mod 360;
	player setDir _setDir;
	sleep 0.01;
};
