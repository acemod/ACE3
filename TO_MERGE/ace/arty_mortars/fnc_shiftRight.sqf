//#define DEBUG_MODE_FULL
#include "script_component.hpp"
#include "\ca\editor\Data\Scripts\dikCodes.h"

private["_phase", "_absPhase", "_degPhase", "_found_anim", "_setDir"];

PARAMS_1(_gun);

GVAR(shiftingSpeed) = getArray(configFile >> "CfgVehicles" >> typeOf _gun >> "ACE" >> "ACE_ARTY" >> "shiftingSpeed");

GVAR(dragGun) = _gun;
closeDialog 0;
player attachTo [_gun, [0,0,-0.27], "shift_right"];

GVAR(stopDragging) = false;
_phase = GVAR(dragGun) animationPhase "MainTurret";

_absPhase = (abs _phase) mod 6400;

if(_phase < 0) then {
	_absPhase = 6400-_absPhase;
};
_degPhase = MIL2DEG(_absPhase);

player setDir (_degPhase - 70) mod 360;

FUNC(handleKeydown) = {
	private "_phase";
	PARAMS_5(_display,_dikCode,_shift,_ctrl,_alt);
	
	_size = GVAR(shiftingSpeed) select 0;
	if(_shift) then {
		_size = GVAR(shiftingSpeed) select 1;
	};

	_result = true;
	if(_dikCode in (actionKeys "moveBack")) then {
		_phase = GVAR(dragGun) animationPhase "MainTurret_RotateFast";
		_phase = (floor _phase);
		_new_phase = _phase+_size;
		GVAR(dragGun) animate["MainTurret_RotateFast", _new_phase];
		_result = false;
	};
	if(_dikCode in (actionKeys "stand") || {_dikCode in (actionKeys "crouch")}) then {
		[] call FUNC(endShift);
		_result = true;
	};
	_result
};

GVAR(drag_keyDownId) = (findDisplay 46) displayAddEventHandler ["KeyDown", QUOTE(_this call FUNC(handleKeydown))];

player playActionNow "grabDrag";

waitUntil { animationState player == "ACINPKNLMSTPSRASWRFLDNON" };

while { !GVAR(stopDragging) } do {
	if( !(alive player) || {!(alive GVAR(dragGun))} || {GVAR(dragGun) call CBA_fnc_locked} ) exitWith {
		[] call FUNC(endShift);
	};
	if !(animationState player in ["acinpknlmstpsraswrfldnon","acinpknlmwlksraswrfldb"]) exitWith {
		player switchMove "ACINPKNLMSTPSRASWRFLDNON";
		[] call FUNC(endShift);
	};
	_phase = GVAR(dragGun) animationPhase "MainTurret_RotateFast";

	_absPhase = (abs _phase) mod 6400;

	if(_phase < 0) then {
		_absPhase = 6400-_absPhase;
	};
	_degPhase = MIL2DEG(_absPhase);
	_setDir = (_degPhase - 70) mod 360;
	player setDir _setDir;
	sleep 0.01;
};
