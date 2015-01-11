//fnc_m137_monitorSight.sqf
#include "script_component.hpp"
private["_reset", "_opticPhase", "_opticAzimuthCounter", "_opticDeflectionCounter", "_opticAzimuthCounterStr",
		"_opticDeflectionCounterStr", "_elevationCount", "_elevationPhase", "_dif", "_elevationCountStr"];
waitUntil {
	!isNil QGVAR(m137Gun)
};
_gun = GVAR(m137Gun);
GVAR(monitorSight) = true;
waitUntil {
	_reset = _gun getVariable QGVAR(resetCounter);
	// player sideChat format["opticPhase: %1", (floor(_gun animationPhase "OpticRevolve"))];
	_opticPhase = (floor(_gun animationPhase "OpticRevolve")*-1);
	_opticPhase = (_opticPhase);
	_opticPhase = _opticPhase + 3200;
	if(_opticPhase > 6400) then {
		_opticPhase = _opticPhase mod 6400;
	};
	if(_opticPhase < 0) then {
		while { _opticPhase < 0 } do { _opticPhase = _opticPhase + 6400; };
	};
	_opticPhaseRaw = (floor(_gun animationPhase "OpticRevolve"));
	_reset = (_opticPhaseRaw + _reset) mod 6400;
	if(_reset > 6400) then {
		_reset = _reset mod 6400;
	};
	if(_reset < 0) then {
		while { _reset < 0 } do { _reset = _reset + 6400; };
	};
	_opticAzimuthCounterStr = [(str _opticPhase), "0", 4] call FUNC(textPad);
	_opticDeflectionCounterStr = [(str _reset), "0", 4] call FUNC(textPad);
	ctrlSetText [137001, _opticAzimuthCounterStr];
	ctrlSetText [137002, _opticDeflectionCounterStr];
	
	_elevationCount = _gun getVariable QGVAR(elevationCounter);
	_elevationPhase = floor(_gun animationPhase "MainGun");
	
	_dif = _elevationCount - _elevationPhase;
	
	_traversePhase = _gun animationPhase "MainTurretTraverse";
	_traversePhase = _traversePhase + 200;
	_percent = (abs (round _traversePhase))/400;
	_traverseIndicator = "----------^----------";
	_tArray = (toArray _traverseIndicator);
	_tLength = (count _tArray);
	_indicPos = ((round(_percent*_tLength))-1 max 0) min 20;
	_tArray set[_indicPos, (toArray "|") select 0];
	_tStr = (toString _tArray);
	ctrlSetText [137008, format["|%1|", _tStr]];

	
	[137004, _dif, 0, 10] call FUNC(m137_bubbleLevel);
	[137009, 0, 10,_gun] call FUNC(m137_OpticBubbleLevel);
	_elevationCountStr = [(str _elevationCount), "0", 4] call FUNC(textPad);
	if(_elevationCount < 0) then {
		_elevationCountStr = format["-%1", _elevationCountStr];
	};
	ctrlSetText [137003, _elevationCountStr];
	sleep 0.05;
	!GVAR(monitorSight)
};