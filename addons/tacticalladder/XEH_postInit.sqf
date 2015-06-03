#include "script_component.hpp"

GVAR(height) = false;
GVAR(rotate) = false;

GVAR(key_add) = {
	GVAR(handlerid_press) = (findDisplay 46) displayAddEventHandler ["KeyDown", QUOTE(_this call GVAR(keypressed))];
	GVAR(handlerid_release) = (findDisplay 46) displayAddEventHandler ["KeyUp", QUOTE(_this call GVAR(keyreleased))];
};
GVAR(key_rem) = {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(handlerid_press)];
	(findDisplay 46) displayRemoveEventHandler ["KeyUp", GVAR(handlerid_release)];
};

GVAR(keypressed) = {
	if (_this select 2) then {
		GVAR(height) = true; // SHIFT for setting height
	};
	if (_this select 3) then {
		GVAR(rotate) = true; // ALT for rotating
	};
};
GVAR(keyreleased) = {
	GVAR(height) = false;
	GVAR(rotate) = false;
};

FUNC(ladderKey_add) = {
	GVAR(ladder_handlerid_press) = (findDisplay 46) displayAddEventHandler ["KeyDown", QUOTE(_this call FUNC(ladder_interaction))];
};
FUNC(ladderKey_remove) = {
	(findDisplay 46) displayRemoveEventHandler ["KeyDown", GVAR(ladder_handlerid_press)];
};

FUNC(ladder_interaction) = {
	private "_fnc_collide";
	#define __ANIMS ["extract_4","extract_5","extract_6","extract_7","extract_8","extract_9","extract_10","extract_11"]
	// Ladder animations start from "extract_4" onwards, because from initial setting, the first three elements extract automatically
	_ladder = GVAR(ladder);
	_key = _this select 1;
	_shift = _this select 2;
	_fnc_collide = {
		_pos1 = ATLtoASL(GVAR(ladder) modelToWorld (GVAR(ladder) selectionPosition "check2"));
		_pos2 = [_pos1 select 0,_pos1 select 1,(_pos1 select 2)+0.4];
		lineIntersects [_pos1, _pos2, GVAR(ladder)]
	};
	
	if (_key == 18 && {!_shift}) then { // UP
		if (call _fnc_collide) exitWith {};
		_currentStep = GVAR(currentStep);
		_currentStep = _currentStep + 1;
		if (_currentStep == 12) exitWith { GVAR(currentStep) = 11; };
		if (_ladder animationPhase (format["extract_%1",_currentStep]) == 0) then {
			_ladder animate [(format["extract_%1",_currentStep]),1];
			GVAR(currentStep) = _currentStep;
		};
	};
	if (_key == 18 && {_shift}) then { 
		_currentAngle = GVAR(currentAngle);
		_currentAngle = _currentAngle + 2.5;
		if (_currentAngle > 90) exitWith { GVAR(currentAngle = 90); };
		_ladder animate ["rotate",_currentAngle];
		GVAR(currentAngle) = _currentAngle;
	};
	if (_key == 16 && {!_shift}) then { // DOWN // TODO: actionKeyName "leanleft"
		_currentStep = GVAR(currentStep);
		if (_currentStep == 3) exitWith { GVAR(currentStep) = 3; };
		if (_ladder animationPhase (format["extract_%1",_currentStep]) == 1) then {
			_ladder animate [(format["extract_%1",_currentStep]),0];
			GVAR(currentStep) = _currentStep - 1;
		};		
	};
	if (_key == 16 && {_shift}) then {
		_currentAngle = GVAR(currentAngle);
		_currentAngle = _currentAngle - 2.5;
		if (_currentAngle <= 0) then { _currentAngle = 0; };
		_ladder animate ["rotate",_currentAngle];
		GVAR(currentAngle) = _currentAngle;	
	};
	false
};
